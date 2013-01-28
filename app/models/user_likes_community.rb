class UserLikesCommunity < ActiveRecord::Base
  attr_accessible :value, :user_id, :community_id
  belongs_to :user
  belongs_to :community

end
