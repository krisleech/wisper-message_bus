# Wisper::MessageBus

Relay [Wisper](https://github.com/krisleech/wisper) events to other processes
as JSON using [MessageBus](https://github.com/SamSaffron/message_bus).

## Installation

```ruby
gem 'wisper-message_bus'
```

## Usage

In order to see that events are being correctly relayed to MessageBus start up
a MessageBus server listening on the "/wisper" channel.

```ruby
require 'message_bus'
MessageBus.subscribe("/wisper") { |msg| puts JSON.parse(msg.data) }
```

Now broadcast Wisper events from a publishers to instances of
`Wisper::MessageBus::Relay` using the regular Wisper broadcasting features.

```ruby
my_publisher.subscribe(Wisper::MessageBus::Relay.new)
```

Any events broadcast by the publisher will be relayed to MessageBus.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
