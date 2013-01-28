class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :post_id, :likes
  belongs_to :user
  belongs_to :post

  has_many :user_likes_comments, :dependent => :destroy, order: 'created_at desc'
end
