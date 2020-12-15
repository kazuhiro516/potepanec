class Potepan::ProductsController < ApplicationController
  MAX_RELATED_PRODUCT = 4.freeze

  def show
    @product = Spree::Product.find(params[:id])
    @taxons = @product.taxons
    @related_products = Spree::Product.related_products(@product).limit(MAX_RELATED_PRODUCT)
  end
end
