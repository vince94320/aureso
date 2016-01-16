require 'slugifier'

describe Slugifier do
  describe "#slugify" do
    it 'slugify a string to be SEO friendly' do
      string_1 = 'A String'
      string_2 = 'Another_String longeR'
      string_3 = 'YEt Another_String even-longeR'

      sut = described_class.new

      expect(sut.slugify(string_1)).to eq 'a-string'
      expect(sut.slugify(string_2)).to eq 'another-string-longer'
      expect(sut.slugify(string_3)).to eq 'yet-another-string-even-longer'
    end
  end
end