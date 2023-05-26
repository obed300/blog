class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.integer :Postid
      t.timestamps
    end
    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :likes, :posts, column: :post_id
  end
end
