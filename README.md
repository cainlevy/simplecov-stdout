# Simplecov::Stdout

Provides a SimpleCov formatter that will print a table to stdout with the information necessary to improve the line coverage of your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov-stdout'
```

## Usage

```ruby
SimpleCov.formatter = SimpleCov::Formatter::Stdout
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cainlevy/simplecov-stdout. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Simplecov::Stdout project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cainlevy/simplecov-stdout/blob/master/CODE_OF_CONDUCT.md).
