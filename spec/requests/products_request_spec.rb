RSpec.describe "Products", type: :request do
  describe "GET/show" do
    let(:product) { create(:product) }

    before do
      get potepan_product_path(product.id)
    end

    it '商品詳細画面の表示に成功すること' do
      expect(response).to have_http_status(200)
    end

    it '商品名が動的に表示されていること' do
      expect(response.body).to include product.name
    end

    it '商品価格が動的に表示されていること' do
      expect(response.body).to include product.display_price.to_s
    end

    it '商品内容が動的に表示されていること' do
      expect(response.body).to include product.description
    end
  end
end
