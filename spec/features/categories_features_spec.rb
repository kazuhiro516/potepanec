RSpec.feature "Categories", type: :feature do
  given(:taxonomy) { create(:taxonomy) }
  given(:taxon) { create :taxon, taxonomy: taxonomy, parent: taxonomy.root }
  given!(:product) { create(:product, taxons: [taxon]) }

  background do
    visit potepan_category_path(taxon.id)
  end

  scenario 'タイトルの要素を検証する' do
    expect(page).to have_title taxon.name
  end

  scenario 'リンクが表示されていること' do
    within('.header') do
      expect(page).to have_link 'HOME'
    end

    within('.pageHeader') do
      expect(page).to have_link 'HOME'
    end
  end

  scenario 'カテゴリーに属する商品が表示されている' do
    expect(page).to have_link product.name
    expect(page).to have_selector '.productBox h5', text: product.name
    expect(page).to have_selector '.productBox h3', text: product.display_price
  end

  scenario 'サイドバーにカテゴリーが表示されていること' do
    expect(page).to have_content '商品カテゴリー'
    expect(page).to have_link taxonomy.name
    click_link taxonomy.name
    expect(page).to have_selector ".panel-body", text: taxon.name
  end
end
