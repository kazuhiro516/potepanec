RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    it "タイトルが正常に表示されること" do
      expect(full_title("test")).to eq "test | BIGBAG"
      expect(full_title("")).to eq "BIGBAG"
      expect(full_title()).to eq "BIGBAG"
    end
  end
end
