require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def test_product_can_have_no_collections
    assert products(:black).valid?, "Products need not belong to a collection"
    assert_empty products(:black).collections, "Black shirt should have no collections"
  end

  def test_product_can_have_multiple_collections
    assert_equal [ collections(:sale).id, collections(:summer).id ].sort,
      products(:green).collection_ids.sort, "A product should retain all of its collection memberships"
  end

  def test_duplicate_membership_is_rejected
    assignment = CollectionAssignment.new(product: products(:red), collection: collections(:sale))
    assert_not assignment.valid?, "A collection must not be assigned twice"
  end

  def test_deleting_product_preserves_shared_collections
    products(:green).destroy!
    assert Collection.exists?(collections(:sale).id), "Deleting a product must preserve the Sale collection"
    assert Collection.exists?(collections(:summer).id), "Deleting a product must preserve the Summer collection"
    assert_empty CollectionAssignment.where(product_id: products(:green).id), "Deleting a product should remove its collection assignments"
  end
end
