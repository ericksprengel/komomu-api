object @like

attributes :id, :user_id, :comment_id, :value, :created_at

node :errors do | u |
	u.errors
end
