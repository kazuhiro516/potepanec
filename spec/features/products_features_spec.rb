RSpec.feature "Products", type: :feature do
  given(:taxonomy) { create(:taxonomy) }
  given(:taxon) { create(:taxon, name: "Taxon", taxonomy: taxonomy, parent: taxonomy.root) }
  given(:product) { create(:product, taxons: [taxon]) }

  background do
    visit potepan_product_path(product.id)
  end

  scenario 'HOMEへのリンクが表示されていること' do
    expect(page).to have_link 'HOME'
  end

  scenario 'タイトルの要素を検証する' do
    expect(page).to have_title product.name
  end

  scenario '商品詳細が表示されている' do
    expect(page).to have_selector '.media-body h2', text: product.name
    expect(page).to have_selector '.media-body h3', text: product.display_price
    expect(page).to have_selector '.media-body p', text: product.description
    expect(page).to have_link '一覧ページへ戻る'
  end
end
