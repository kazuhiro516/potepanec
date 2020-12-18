RSpec.describe Spree::ProductDecorator, type: :model do
  describe 'related_productsのテスト' do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, name: "Taxon", taxonomy: taxonomy, parent: taxonomy.root) }
    let(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 4, taxons: [taxon]) }

    it '定数に指定した件数のみ取得できていること' do
      expect(product.related_products.count).to eq 4
    end
  end
end
