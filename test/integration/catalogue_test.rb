require "test_helper"

class CatalogueTest < ActionDispatch::IntegrationTest
  def test_catalogue_displays_memberships_for_each_product
    get root_path
    assert_response :success, "Catalogue should load successfully"
    assert_select "#product_#{products(:green).id}", { count: 1 }, "Catalogue should include Green shirt exactly once" do
      assert_select "th", { text: "Green shirt" }, "The product row should display its name"
      assert_select ".badge", { text: "Sale" }, "Green shirt should display its Sale membership"
      assert_select ".badge", { text: "Summer" }, "Green shirt should display its Summer membership"
    end
    assert_select "#product_#{products(:black).id}", { count: 1 }, "Catalogue should include products with no collections" do
      assert_select "td", { text: "-" }, "Products with no collections should display a dash"
      assert_select ".badge", { count: 0 }, "Products with no collections should have no membership badges"
    end
  end

  def test_empty_catalogue
    Product.destroy_all
    get products_path
    assert_response :success, "Catalogue should load successfully"
    assert_select ".catalogue p", { text: "No products yet." }, "An empty catalogue should display its empty-state message"
    assert_select "table", { count: 0 }, "An empty catalogue should not display a table"
  end
end
