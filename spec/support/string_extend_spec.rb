describe 'String' do

  describe "#titleize" do

    it "capitalizes each word in a string" do
      expect('hola choro'.titleize).to eq('Hola Choro')
    end

    it "works with single-word strings" do
      expect('hola'.titleize).to eq('Hola')
    end

    it "capitalizes all uppercase strings" do
      expect('hola FEO'.titleize).to eq('Hola Feo')
    end

    it "capitalizes mixed-case strings" do
      expect('hola RaTon Con COLA'.titleize).to eq('Hola Raton Con Cola')
    end

  end

  describe '#blank?' do

    it "returns true if string is empty" do
      expect(''.blank?).to be(true)
    end

    it "returns true if string contains only spaces" do
      expect('  '.blank?).to be(true)
    end

    it "returns true if string contains only tabs" do
      # Get a tab using a double-quoted string with \t
      # example: "\t\t\t"
      expect("\t\t\t".blank?).to be(true)
    end

    it "returns true if string contains only spaces and tabs" do
      expect("  \t\t \t ".blank?).to be(true)
    end

    it "returns false if string contains a letter" do
      expect("a".blank?).not_to be(true)
    end

    it "returns false if string contains a number" do
      expect("1".blank?).not_to be(true)
    end

  end

end
