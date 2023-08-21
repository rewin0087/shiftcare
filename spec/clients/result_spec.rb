require 'utils'

describe Clients::Result do
  describe '#call' do
    let(:filtered_result) do
      [
        {
          id: 1,
          full_name: 'John Doe',
          email: 'john.doe@gmail.com'
        },
        {
          id: 2,
          full_name: 'John Smith',
          email: 'john.smith@gmail.com'
        },
        {
          id: 3,
          full_name: 'Jack Hammer',
          email: 'jack.hammer@gmail.com'
        },
        {
          id: 4,
          full_name: 'Jack Hammer 2',
          email: 'jack.hammer@gmail.com'
        }
      ]
    end

    let(:expected_result) do
      {
        result: [
          {
            id: 1,
            full_name: 'John Doe',
            email: 'john.doe@gmail.com'
          },
          {
            id: 2,
            full_name: 'John Smith',
            email: 'john.smith@gmail.com'
          }
        ],
        duplicate_result_based_from_email: [
          {
            id: 3,
            full_name: 'Jack Hammer',
            email: 'jack.hammer@gmail.com'
          },
          {
            id: 4,
            full_name: 'Jack Hammer 2',
            email: 'jack.hammer@gmail.com'
          }
        ]
      }
    end

    subject { described_class.new(filtered_result).call }

    it { is_expected.to eq(expected_result) }
  end
end
