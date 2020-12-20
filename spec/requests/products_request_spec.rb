RSpec.describe "Products", type: :request do
  before do
    get potepan_product_path(product.id)
  end

  describe "商品詳細画面のテスト" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, name: "Taxon", taxonomy: taxonomy, parent: taxonomy.root) }
    let(:product) { create(:product, taxons: [taxon]) }
    let(:unrelated_products) { create_list(:product, 5, taxons: [taxon]) }

    it '正常にレスポンスが返ってくること' do
      expect(response).to be_success
    end

    it '商品詳細画面の表示に成功すること' do
      expect(response).to have_http_status(200)
    end

    it '商品名が含まれていること' do
      expect(response.body).to include product.name
    end

    it '商品価格が含まれていること' do
      expect(response.body).to include product.display_price.to_s
    end

    it '商品内容が含まれていること' do
      expect(response.body).to include product.description
    end

    it '関連商品の取得を4つに制限していること' do
      expect(unrelated_products).not_to eq Potepan::ProductsController::MAX_RELATED_PRODUCT_COUNT
    end
  end
end
