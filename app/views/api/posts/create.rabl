object @post

attributes :id, :description, :image, :title, :url, :user_id, :community_id, :created_at

node :errors do | u |
	u.errors
end
