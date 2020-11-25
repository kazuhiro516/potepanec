RSpec.describe ApplicationHelper, type: :helper do
  let(:base_title) { 'BIGBAG'.freeze }

  describe 'タイトルのテスト' do
    it 'タイトルが正常に表示されること' do
      expect(full_title("test")).to eq "test | #{base_title}"
    end
    it '値が文字列の場合base_titleを返す' do
      expect(full_title("")).to eq "#{base_title}"
    end
    it '値がない場合base_titleを返す' do
      expect(full_title(nil)).to eq "#{base_title}"
    end
  end
end
