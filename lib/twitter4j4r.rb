require 'twitter4j4r/client'
require 'twitter4j4r/config'
require 'jar/twitter4j-core-2.2.6.jar'
require 'json'


module Twitter4j4r

  Java::Twitter4j::Status.class_eval do
    def raw_json
      Java::Twitter4jJson::DataObjectFactory.getRawJSON self
    end

    def to_json
      JSON.parse raw_json unless raw_json.nil?
    end
  end
end