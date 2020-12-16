module Spree::ProductDecorator
  Spree::Product.class_eval do
    def related_products
      Spree::Product.in_taxons(taxons).includes(master: [:default_price, :images]).
        where.not(id: id).distinct
    end
  end
end
