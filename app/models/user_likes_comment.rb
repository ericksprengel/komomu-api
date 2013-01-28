class UserLikesComment < ActiveRecord::Base
  attr_accessible :value, :user_id, :comment_id
  belongs_to :user
  belongs_to :comment
end
