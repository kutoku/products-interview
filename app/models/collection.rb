class Collection < ApplicationRecord
  has_many :collection_assignments, dependent: :destroy
  has_many :products, through: :collection_assignments

  validates :name, presence: true, uniqueness: true
end
