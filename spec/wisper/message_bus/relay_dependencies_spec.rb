RSpec.describe Wisper::MessageBus::Relay do
  describe '#message_bus' do
    it 'returns MessageBus' do
      subject = described_class.new
      expect(subject.message_bus).to eq ::MessageBus
    end

    it 'is injectable via initializer' do
      message_bus = double('MessageBus')
      subject = described_class.new(message_bus: message_bus)
      expect(subject.message_bus).to eq message_bus
    end

    it 'is injectable via setter' do
      message_bus = double('MessageBus')
      subject = described_class.new
      subject.message_bus = message_bus
      expect(subject.message_bus).to eq message_bus
    end
  end # message_bus

  describe '#serializer' do
    it 'returns Serializer instance' do
      subject = described_class.new
      expect(subject.serializer).to be_instance_of(Wisper::MessageBus::Serializer)
    end

    it 'is injectable via initializer' do
      serializer = double('serializer')
      subject = described_class.new(serializer: serializer)
      expect(subject.serializer).to eq serializer
    end

    it 'is injectable via setter' do
      serializer = double('serializer')
      subject = described_class.new
      subject.serializer = serializer
      expect(subject.serializer).to eq serializer
    end
  end # serializer
end
