object @community

attributes :id, :name, :image, :description, :user_id, :created_at

node :errors do | u |
	u.errors
end
