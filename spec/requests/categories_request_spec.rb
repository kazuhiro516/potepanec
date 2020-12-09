RSpec.describe "Categories", type: :request do
  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create :taxon, taxonomy: taxonomy }
  let!(:product) { create(:product, taxons: [taxon]) }

  before do
    get potepan_category_path(taxon.id)
  end

  it 'showテンプレートが表示されていること' do
    expect(response).to render_template(:show)
  end

  it '200レスポンスが返ってくること' do
    expect(response).to have_http_status(200)
  end

  it '正しいレスポンスが返ってくること' do
    expect(response).to be_success
  end

  it '@taxonに値が入っていること' do
    expect(assigns(:taxon)).to eq taxon
  end

  it '@taxonomiesに値が入っていること' do
    expect(assigns(:taxonomies)).to match_array([taxonomy])
  end

  it '@productsに値が入っていること' do
    expect(assigns(:products)).to include product
  end
end
