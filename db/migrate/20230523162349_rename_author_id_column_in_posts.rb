class RenameAuthorIdColumnInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :AuthorId, :author_id
  end
end
