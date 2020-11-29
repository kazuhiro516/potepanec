RSpec.describe ApplicationHelper, type: :helper do
  let(:base_title) { 'BIGBAG'.freeze }

  describe 'タイトルのテスト' do
    it 'タイトルが正常に表示されること' do
      expect(full_title("test")).to eq "test - #{base_title}"
    end
    it '値が文字列の場合base_titleを返す' do
      expect(full_title("")).to eq "#{base_title}"
    end
    it '値がない場合base_titleを返す' do
      expect(full_title(nil)).to eq "#{base_title}"
    end
  end

  describe 'light_sectionのタイトルテスト' do
    it '引数に期待される文字列が入っていること' do
      expect(heading_title("test-category")).to eq ["test-category"]
    end
    it '引数に/を含む文字列が入っていること' do
      expect(heading_title("test-category/product")).to eq ["test-category", "product"]
    end
    it '引数が空白文字列の場合' do
      expect(heading_title("")).to eq [""]
    end
  end
end
