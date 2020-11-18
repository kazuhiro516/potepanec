require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET/show" do
    let(:product) { create(:product) }
    it '商品詳細画面の表示に成功すること' do
    get potepan_product_path(product.id)
    expect(response).to have_http_status(200)
    end
  end
end
