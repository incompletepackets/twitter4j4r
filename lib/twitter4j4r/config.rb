require 'jar/twitter4j-core-3.0.3.jar'

module Twitter4j4r
  class Config
    def initialize
      @config = Java::Twitter4jConf::ConfigurationBuilder.new
      @config.setDebugEnabled true
      @config.setJSONStoreEnabled true
    end

    def consumer_key= consumer_key
      @config.setOAuthConsumerKey consumer_key
    end

    def consumer_secret= consumer_secret
      @config.setOAuthConsumerSecret consumer_secret
    end

    def access_token= access_token
      @config.setOAuthAccessToken access_token
    end

    def access_token_secret= access_token_secret  
      @config.setOAuthAccessTokenSecret access_token_secret
    end

    def username= username
      raise "As of API v1.1, authorizing using username/password is not longer an option."
    end

    def password= password
      raise "As of API v1.1, authorizing using username/password is not longer an option."
    end

    def build
      @config.build
    end
  end
end