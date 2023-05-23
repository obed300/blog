class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :Postid
      t.text :Text
      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :Postid
  end
end