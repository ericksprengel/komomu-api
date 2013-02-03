object @comment

attributes :id, :text, :user_id, :post_id, :likes, :created_at

node :errors do | u |
	u.errors
end
