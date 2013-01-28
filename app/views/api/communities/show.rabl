Rabl.configure do |config|
  config.include_child_root = false
end
object @community

attributes :id, :name, :image, :description, :user_id, :likes, :user_liked, :created_at
child(:posts) { attributes :id, :url, :description, :title, :created_at, :image, :user_id, :relevance, :likes }

