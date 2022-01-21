[![Ruby](https://github.com/Ruby-Octopus/ruby-octopus/actions/workflows/main.yml/badge.svg)](https://github.com/Ruby-Octopus/ruby-octopus/actions/workflows/main.yml)
# RubyOctopus

RubyOctopus is a REST client for [Octopus Deploy](https://octopus.com/) written in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyoctopus'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubyoctopus

## Usage

Create an instance of the `OctopusClient` class by passing your Octopus API URL and an API key to it.

```ruby
example = RubyOctopus::OctopusClient.new("octopus_domain_here/api", "API-key_goes_here")
```

TODO: Add more examples, as the class gets built out more.

## Development

(OPTIONAL) Can use Visual Studio Code to Open Folder in Container via their Remote - Containers extension.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ruby-Octopus/ruby-octopus.
