require 'jar/twitter4j-stream-3.0.3.jar'
require 'jruby/core_ext'

require 'twitter4j4r/stream/listener'

module Twitter4j4r
  class UserListener < Listener
    include Java::Twitter4j::UserStreamListener

    [[ :onException,               :exception ],
     [ :onDeletionNotice,          :delete ],
     [ :onBlock,                   :block ],
     [ :onDirectMessage,           :dm ],
     [ :onFriendList,              :friend_list ],
     [ :onFavorite,                :favorite ],
     [ :onStatus,                  :status ],
     [ :onFollow,                  :follow ],
     [ :onUnblock,                 :unblock ],
     [ :onUnfavorite,              :unfavorite ],
     [ :onUserListCreation,        :user_list_creation ],
     [ :onUserListDeletion,        :user_list_deletion ],
     [ :onUserListMemberAddition,  :user_list_member_addition ],
     [ :onUserListMemberDeletion,  :user_list_member_deletion ],
     [ :onUserListSubscription,    :user_list_subscription ],
     [ :onUserListUnsubscription,  :user_list_unsubscription ],
     [ :onUserListUpdate,          :user_list_update ],
     [ :onUserProfileUpdate,       :user_profile_update ]
    ].each do |method|
      define_method(method[0]) do |*args|
        call_block_with_client(method[1], *args)
      end
    end
  end
end

Twitter4j4r::UserListener.become_java!