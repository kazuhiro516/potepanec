class Potepan::ProductsController < ApplicationController
  MAX_RELATED_PRODUCT = 4
  MAX_RELATED_PRODUCT.freeze

  def show
    @product = Spree::Product.find(params[:id])
    @taxons = @product.taxons
    @related_products = @product.related_products.limit(MAX_RELATED_PRODUCT)
  end
end
