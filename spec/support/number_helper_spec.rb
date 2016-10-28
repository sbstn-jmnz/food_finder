# encoding: UTF-8
describe 'NumberHelper' do

  include NumberHelper

  describe '#number_to_currency' do

    context 'using default values' do

      it "correctly formats an integer" do
        num = number_to_currency(3)
        expect(num).to eq('$3.00')
      end

      it "correctly formats a float" do
        num = number_to_currency(3.1)
        expect(num).to eq('$3.10')
      end

      it "correctly formats a string" do
        num = number_to_currency('3.1')
        expect(num).to eq('$3.10')
      end

      it "uses delimiters for very large numbers" do
        num = number_to_currency('31000')
        expect(num).to eq('$31,000.00')
      end

      it "does not have delimiters for small numbers" do
        num = number_to_currency(3)
        expect(num).to eq('$3.00')
      end

    end

    context 'using custom options' do

      it 'allows changing the :unit' do
        num = number_to_currency 3, unit: '#'
        expect(num).to eq('#3.00')
      end

      it 'allows changing the :precision' do
        num = number_to_currency 3, precision: 1
        expect(num).to eq('$3.0')
      end

      it 'omits the separator if :precision is 0' do
        num = number_to_currency 3, precision: 0
        expect(num).to eq('$3')
      end

      it 'allows changing the :delimiter' do
        num = number_to_currency 3000, delimiter: '.'
        expect(num).to eq('$3.000.00')
      end

      it 'allows changing the :separator' do
        num = number_to_currency 3000, separator: ','
        expect(num).to eq('$3,000,00')
      end

      it 'correctly formats using multiple options' do
        num = number_to_currency 3000, separator: ',', delimiter: '.'
        expect(num).to eq('$3.000,00')
      end
    end

  end

end
