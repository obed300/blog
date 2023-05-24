class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :Title
      t.text :Text
      t.timestamps
      t.integer :CommentsCounter
      t.integer :LikesCounter
    end
    # add_foreign_key :posts, :users, column: :author_id
  end
end
