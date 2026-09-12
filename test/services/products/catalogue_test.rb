require "test_helper"

class Products::CatalogueTest < ActiveSupport::TestCase
  def test_returns_products_with_their_collections
    records = Products::Catalogue.call.to_a
    assert_equal records.map(&:name).sort, records.map(&:name)
    green = records.find { |product| product.id == products(:green).id }
    assert green.association(:collections).loaded?, "Catalogue should preload collection memberships"
    assert_equal [ "Sale", "Summer" ], green.collections.map(&:name).sort
  end
end
