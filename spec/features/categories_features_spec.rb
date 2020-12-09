RSpec.feature "Categories", type: :feature do
  given(:taxonomy) { create(:taxonomy) }
  given(:taxon) { create :taxon, taxonomy: taxonomy }
  given!(:product) { create(:product, taxons: [taxon]) }

  background do
    visit potepan_category_path(taxon.id)
  end

  scenario '現在のパスが等しいことを検証する' do
    expect(current_path).to eq potepan_category_path(taxon.id)
  end

  scenario 'タイトルの要素を検証する' do
    expect(page).to have_title taxon.name
  end

  scenario 'HOMEへのリンクが表示されていること' do
    expect(page).to have_link 'HOME'
  end

  scenario '各カテゴリーへのリンクが表示されていること' do
    expect(page).to have_link taxonomy.name
  end

  scenario '各商品へのリンクが表示されていること' do
    expect(page).to have_link product.name
  end

  scenario '商品名が表示されている' do
    expect(page).to have_selector '.productBox h5', text: product.name
  end

  scenario '値段が表示されている' do
    expect(page).to have_selector '.productBox h3', text: product.display_price
  end

  scenario '文字列が表示されていること' do
    expect(page).to have_content '商品カテゴリー'
  end
end
