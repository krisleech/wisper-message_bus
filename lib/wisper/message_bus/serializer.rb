require 'json'

# Serializes event name and payload to JSON
#
# @api private

module Wisper
  module MessageBus
    class Serializer
      ArgumentError = ::ArgumentError

      def call(name, args)
        validate_args(args)
        payload = args[0] || {}
        JSON.generate({ event: name }.merge(payload))
      end

      private

      def validate_args(args)
        if args.size > 1
          fail ArgumentError, "Can not serialize events with more than one argument"
        end

        unless args[0].is_a?(Hash) || args[0] == nil
          fail ArgumentError, "Can not serialize events with non-hash payload"
        end
      end
    end
  end
end
