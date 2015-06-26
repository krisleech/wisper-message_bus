RSpec.describe Wisper::MessageBus::Relay do
  describe '#respond_to?' do
    it 'returns true' do
      subject = described_class.new
      expect(subject.responds_to?('foobar')).to eq true
    end
  end

  describe 'relaying events (#method_missing)' do
    it 'relays event to MessageBus' do
      message_bus = double('MessageBus')
      serializer = double('Serializer')
      allow(serializer).to receive(:call).and_return('serialized_json')
      subject = described_class.new(message_bus: message_bus, serializer: serializer)
      expect(message_bus).to receive(:publish).with("/wisper", 'serialized_json')
      subject.it_happened
    end
  end
end
