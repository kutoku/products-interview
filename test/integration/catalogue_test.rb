require "test_helper"

class CatalogueTest < ActionDispatch::IntegrationTest
  def test_catalogue_displays_memberships_for_each_product
    get root_path
    assert_response :success
    assert_select "#product_#{products(:green).id}" do
      assert_select "th", text: "Green shirt"
      assert_select ".badge", text: "Sale"
      assert_select ".badge", text: "Summer"
    end
    assert_select "#product_#{products(:black).id}" do
      assert_select "td", text: "-"
      assert_select ".badge", count: 0
    end
  end

  def test_repeated_requests_with_a_session_cookie
    previous = ActionController::Base.allow_forgery_protection
    ActionController::Base.allow_forgery_protection = true

    get root_path
    assert_response :success
    assert_not_empty response.headers["set-cookie"], "First request must establish a session"
    get root_path
    assert_response :success
    assert_select "meta[name=csrf-token]", count: 1
  ensure
    ActionController::Base.allow_forgery_protection = previous
  end

  def test_empty_catalogue
    Product.destroy_all
    get products_path
    assert_response :success
    assert_select ".catalogue p", text: "No products yet."
    assert_select "table", count: 0
  end
end
