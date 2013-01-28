class UserLikesPost < ActiveRecord::Base
  attr_accessible :value, :user_id, :post_id
  belongs_to :user
  belongs_to :post
end
