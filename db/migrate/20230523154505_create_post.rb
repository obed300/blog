class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :Title
      t.text :Text
      t.timestamps
      t.integer :comments_counter
      t.integer :likes_counter
    end
  end
end
