class Product < ApplicationRecord
  has_many :collection_assignments, dependent: :destroy
  has_many :collections, through: :collection_assignments

  validates :name, presence: true
end
