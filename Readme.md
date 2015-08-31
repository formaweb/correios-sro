# Correios SRO

Tracking object system from Correios (Brazil).

## Installation

Add this line to your application's Gemfile:

    gem 'correios-sro'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install correios-sro

## Usage

### Basic

```ruby
package = CorreiosSRO.track('SS987654321BR')

if package
  puts package.number
  package.status.each do |status|
    puts status.date
    puts status.place
    puts status.track
    puts status.details
  end
end
```

### First or Last

```ruby
package = CorreiosSRO.track('SS987654321XX')

if package
  puts package.first.date
  puts package.last.date
end
```

## Contributing

1. Fork it ( https://github.com/formaweb/correios-sro/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
