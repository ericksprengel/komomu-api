class CreateUserLikesPosts < ActiveRecord::Migration
  def change
    create_table :user_likes_posts do |t|
      t.integer :value
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
