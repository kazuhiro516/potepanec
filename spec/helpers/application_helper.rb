RSpec.describe ApplicationHelper, type: :helper do
  let(:base_title) { 'BIGBAG'.freeze }

  describe "#full_title" do
    it "タイトルが正常に表示されること" do
      expect(full_title("test")).to eq "test | #{base_title}"
      expect(full_title("")).to eq "#{base_title}"
      expect(full_title(nil)).to eq "#{base_title}"
    end
  end
end
