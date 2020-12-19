RSpec.describe Spree::ProductDecorator, type: :model do
  describe 'related_productsのテスト' do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, name: "Taxon", taxonomy: taxonomy, parent: taxonomy.root) }
    let(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 4, taxons: [taxon]) }
    let!(:related_products_test) { create_list(:product, 5, taxons: [taxon]) }

    it '定数に指定した件数のみ取得できていること' do
      expect(related_products.count).to eq 4
    end

    it '関連しない商品が含まれていないこと' do
      expect(product.related_products).not_to include product.taxons
    end

    it '自商品が含まれていないこと' do
      expect(product.related_products).not_to include product
    end

    it '関連商品が4件に制限されること' do
      expect(product.related_products).not_to eq related_products_test
    end
  end
end
