require 'jar/twitter4j-stream-3.0.3.jar'
require 'jruby/core_ext'


require 'twitter4j4r/stream/listener'

module Twitter4j4r
  class PublicListener < Listener
    include Java::Twitter4j::StatusListener

    [[ :onStatus,                 :status ],
     [ :onException,              :exception ],
     [ :onTrackLimitationNotice,  :limitation ],
     [ :onDeletionNotice,         :delete ]
    ].each do |method|
      define_method(method[0]) do |*args|
        call_block_with_client(method[1], *args)
      end
    end
  end
end

Twitter4j4r::PublicListener.become_java!
