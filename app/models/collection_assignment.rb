class CollectionAssignment < ApplicationRecord
  belongs_to :product
  belongs_to :collection

  validates :collection_id, uniqueness: { scope: :product_id }
end
