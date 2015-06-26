RSpec.describe Wisper::MessageBus::Serializer do
  describe '#call' do
    describe 'given zero arguments' do
      it 'returns JSON containing event' do
        expect(subject.call('it_happened', [])).to eq json({ event: "it_happened" })
      end
    end

    describe 'given one hash argument' do
      it 'returns JSON containing event and argument' do
        expect(subject.call('it_happened', [{ name: 'FOO' }])).to eq json({ event: "it_happened", name: 'FOO' })
      end
    end

    describe 'given one non-hash argument' do
      it 'raise an error' do
        expect { subject.call('it_happened', [1]) }.to raise_error(described_class::ArgumentError)
      end
    end

    describe 'given multiple arguments' do
      it 'raise an error' do
        expect { subject.call('it_happened', [1,2,3]) }.to raise_error(described_class::ArgumentError)
      end
    end

    def json(hash)
      JSON.generate(hash)
    end
  end
end
