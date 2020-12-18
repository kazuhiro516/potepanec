RSpec.feature "Products", type: :feature do
  given(:taxonomy) { create(:taxonomy) }
  given(:taxon) { create(:taxon, name: "Taxon", taxonomy: taxonomy, parent: taxonomy.root) }
  given(:product) { create(:product, taxons: [taxon]) }
  given!(:related_products) { create_list(:product, 4, taxons: [taxon]) }

  background do
    visit potepan_product_path(product.id)
  end

  scenario 'リンクが表示されていること' do
    within('.header') do
      expect(page).to have_link 'HOME'
    end

    within('.pageHeader') do
      expect(page).to have_link 'HOME'
    end
  end

  scenario 'タイトルの要素を検証する' do
    expect(page).to have_title product.name
  end

  scenario '商品詳細が表示されている' do
    within('.media') do
      expect(page).to have_selector '.media-body h2', text: product.name
      expect(page).to have_selector '.media-body h3', text: product.display_price
      expect(page).to have_selector '.media-body p', text: product.description
      expect(page).to have_link '一覧ページへ戻る'
    end
  end

  scenario '関連商品が表示されていること' do
    within('.productsContent') do
      related_products.each do |related_product|
        expect(page).to have_selector '.productBox h5', text: related_product.name
        expect(page).to have_selector '.productBox h3', text: related_product.display_price
        expect(page).to have_link related_product.name
        expect(page).to have_link related_product.display_price
        click_link related_product.name, href: potepan_product_path(related_product.id)
        expect(current_path).to eq potepan_product_path(related_product.id)
        expect(page).to have_http_status(:success)
      end
    end
  end
end
