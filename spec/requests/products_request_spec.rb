RSpec.describe "Products", type: :request do
  before do
    get potepan_product_path(product.id)
  end

  describe "商品詳細画面のテスト" do
    let!(:product) { create(:product) }

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

    it '正しいviewを返すこと' do
      expect(response).to render_template :show
    end
  end
end
