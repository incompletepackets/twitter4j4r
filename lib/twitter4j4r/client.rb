require 'jar/twitter4j-core-3.0.3.jar'
require 'jar/twitter4j-stream-3.0.3.jar'
require 'jar/twitter4j-async-3.0.3.jar'

require 'twitter4j4r/stream'
require 'twitter4j4r/config'

module Twitter4j4r
  class Client
    def initialize(config)
      unless config.is_a? Config
        auth_map                    = config
        config                      = Twitter4j4r::Config.new
        config.consumer_key         = auth_map[:consumer_key]
        config.consumer_secret      = auth_map[:consumer_secret]
        config.access_token         = auth_map[:access_token]
        config.access_token_secret  = auth_map[:access_secret]
      end

      @config = config.build
      @streams = { }
    end

    def add_stream name
      stream = Twitter4j4r::Stream.new @config
      @streams[name] = stream
      stream
    end

    def stream name
      @streams[name]
    end
  end
end
