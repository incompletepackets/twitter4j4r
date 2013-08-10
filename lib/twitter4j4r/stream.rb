require 'jar/twitter4j-core-3.0.3.jar'
require 'jar/twitter4j-stream-3.0.3.jar'
require 'jar/twitter4j-async-3.0.3.jar'

require 'twitter4j4r/stream/public-listener'
require 'twitter4j4r/stream/user-listener'

module Twitter4j4r
  class Stream

    def initialize 
      @blocks = { }
    end

    def on_exception(&block)
      on_notice(:exception, block)
    end

    def on_favorite(&block)
      on_notice(:favorite, block)
    end

    def on_limitation(&block)
      on_notice(:limitation, block)
    end

    def on_status(&block)
      on_notice(:status, block)
    end

    def on_deletion(&block)
      on_notice(:delete, block)
    end

    def on_notice(block_name, &block)
      @blocks[block_name] = block
      self
    end

    def track(*terms, &block)
      on_status(&block)  
      @stream.addListener(PublicListener.new(self, @blocks))
      @stream.filter(Java::Twitter4j::FilterQuery.new(0, nil, search_terms.to_java(:string)))
    end
    
    def sample(&block)
      on_status(&block)  
      @stream.addListener(PublicListener.new(self, @blocks))
      @stream.sample
    end

    def start(config)
      @stream = Java::Twitter4j::TwitterStreamFactory.new(config).instance
    end

    def stop
      @stream.cleanUp
      @stream.shutdown
    end
  end
end