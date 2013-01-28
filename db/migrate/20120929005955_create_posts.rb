class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :description
      t.string :title
      t.string :image
      t.integer :user_id
      t.integer :community_id
      t.integer :likes

      t.timestamps
    end
  end
end
