require 'message_bus'
require_relative 'serializer'

# Relays all messages (events) to MessageBus
#
# @api private

module Wisper
  module MessageBus
    class Relay
      attr_accessor :message_bus, :channel, :serializer

      def initialize(options = {})
        self.message_bus = options.fetch(:message_bus) { ::MessageBus }
        self.serializer  = options.fetch(:serializer)  { Serializer.new }
        self.channel     = '/wisper'
      end

      def responds_to?(name, include_all = false)
        true
      end

      def method_missing(name, *args, &block)
        message_bus.publish(channel, serializer.call(name, args))
      end
    end
  end
end
