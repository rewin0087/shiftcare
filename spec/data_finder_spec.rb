require 'utils'

describe DataFinder do
  describe '#call' do
    let(:options) { { name: 'John' } }
    let(:clients_result) { [] }
    let(:mock_clients) { instance_double(Clients, filter: clients_result) }

    subject { described_class.new(options).call }

    before do
      expect(Clients).to receive(:new)
        .and_return(mock_clients)
    end

    it { is_expected.to eq(clients_result) }
  end
end
