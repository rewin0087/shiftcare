require 'utils'

describe Clients do
  describe '#filter' do
    context 'default source' do
      let(:params) { { name: 'john', filter: 'full_name:smith' } }
      let(:expected_result) do
        [
          {
            id: 1,
            full_name: 'John Doe',
            email: 'john.doe@gmail.com'
          },
          {
            id: 2,
            full_name: 'Jane Smith',
            email: 'jane.smith@yahoo.com'
          },
          {
            id: 3,
            full_name: 'Alex Johnson',
            email: 'alex.johnson@hotmail.com'
          },
          {
            id: 15,
            full_name: 'Another Jane Smith',
            email: 'jane.smith@yahoo.com'
          }
        ]
      end

      let(:mock_service) { instance_double(Clients::Result, call: nil) }

      subject { described_class.new.filter(params) }

      before do
        expect(Clients::Result).to receive(:new)
          .with(expected_result)
          .and_return(mock_service)
      end

      it { is_expected.to be_nil }
    end
  end
end
