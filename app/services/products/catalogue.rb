module Products
  class Catalogue
    include Service

    def call
      Product.includes(:collections).order(:name, :id)
    end
  end
end
