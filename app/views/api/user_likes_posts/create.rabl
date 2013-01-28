object @like

attributes :id, :user_id, :post_id, :value, :created_at

node :errors do | u |
	u.errors
end
