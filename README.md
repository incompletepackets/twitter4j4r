# Twitter4j4r

A thin, woefully inadequate wrapper around [twitter4j](http://twitter4j.org/)
forked from [tobias](https://github.com/tobias/twitter4j4r). It will only work
under JRuby.


## Installation

Add this line to your application's Gemfile:

    gem 'incomplete-twitter4j4r'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install incomplete-twitter4j4r


## Usage

Create a configuration object:

    @config = Twitter4j4r::Config.new
    @config.username = 'username'
    @config.password = 'password'
    
    @client = Twitter4j4r::Client.new @config

Or with OAuth:

    @config = Twitter4j4r::Config.new
    @config.consumer_key         = 'ABC456'
    @config.consumer_secret      = 'ABC456'
    @config.access_token         = 'ABC456'
    @config.access_token_secret  = 'ABC456'
    
    @client = Twitter4j4r::Client.new @config 

To access the sample stream:

    @client.sample do |tweet|
      puts "#{tweet.user.screen_name} says \"#{tweet.text}\""
    end

Tracking a keyword:
    
    @client.track('bieber') do |tweet|
      puts "#{tweet.user.screen_name} says #{tweet.text}"
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



Thanks to [Tobias Crawley](https://github.com/tobias) for the original codebase.
