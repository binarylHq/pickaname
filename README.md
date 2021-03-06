
# Pickaname

Generates random username

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pickaname'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pickaname

## Usage

To generate a name like celebrity:

```ruby
Pickaname::Robot.celebrity
```

To generate a vocabulary name:

```ruby
Pickaname::Robot.common
```

To generate a dark name:

```ruby
Pickaname::Robot.dark
```

To generate a funny name:

```ruby
Pickaname::Robot.funny
```

To generate a random name:

```ruby
Pickaname::Robot.random_letters
```

Pass `length` as an optional argument to generate a name with specific length:

```ruby
Pickaname::Robot.celebrity(length: 8)
Pickaname::Robot.common(length: 8)
Pickaname::Robot.dark(length: 8)
Pickaname::Robot.funny(length: 8)
Pickaname::Robot.random_letters(length: 8)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/binarylHq/pickaname. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/binarylHq/pickaname/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pickaname project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/binarylHq/pickaname/blob/master/CODE_OF_CONDUCT.md).

## Authors and acknowledgment

[![](https://github.com/karandocs.png?size=100)](https://github.com/karandocs)
