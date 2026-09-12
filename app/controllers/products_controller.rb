class ProductsController < ApplicationController
  def index
    @products = Products::Catalogue.call
  end
end
