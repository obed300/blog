class RemoveForeignKeyFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :posts, foreign_key: true
  end
end
