# Rack::NeverLocal
[![Build Status](https://secure.travis-ci.org/JonRowe/rack-neverlocal.png)](http://travis-ci.org/JonRowe/rack-neverlocal) [![Code Climate](https://codeclimate.com/github/JonRowe/rack-neverlocal.png)](https://codeclimate.com/github/JonRowe/rack-neverlocal)

Prevents Rails from considering requests as local. (It's a work around
for a bug in older versions of Passenger with Rails)

## Installation

Add this line to your application's Gemfile:

    gem 'rack-neverlocal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-neverlocal

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
