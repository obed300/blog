class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false, foreign_key: { to_table: :users }, index: true
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.timestamps
    end
  end
end
