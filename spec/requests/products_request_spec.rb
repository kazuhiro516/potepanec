require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET/show" do
    let(:product) { create(:product) }
    it '商品詳細画面の表示に成功すること' do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(200)
    end
    it '商品名が動的に表示されていること' do
      expect(product.name).to eq product.name
    end
    it '商品価格が動的に表示されていること' do
      expect(product.price).to eq product.price
    end
    it '商品内容が動的に表示されていること' do
      expect(product.description).to eq product.description
    end
    it '商品画像が動的に表示されていること' do
      expect(product.images).to eq product.images
    end
  end
end
