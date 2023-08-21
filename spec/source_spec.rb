require 'utils'

describe Source do
  describe '.read' do
    let(:source_path) { 'path' }

    subject { described_class.read(source_path) }

    context 'file adapter' do
      let(:mock_service) { instance_double(Source::File, call: nil) }

      it 'return adapter' do
        expect(Source::File).to receive(:new)
          .with(source_path)
          .and_return(mock_service)

          is_expected.to be_nil
      end
    end
  end
end
