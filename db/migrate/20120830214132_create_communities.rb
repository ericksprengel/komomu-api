class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
