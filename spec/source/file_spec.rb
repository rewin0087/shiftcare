require 'utils'

describe Source::File do
  describe '#call' do
    let(:source_path) { 'path' }

    it 'return file driver' do
      expect(::File).to receive(:read).with(source_path)

      described_class.new(source_path).call
    end
  end
end
