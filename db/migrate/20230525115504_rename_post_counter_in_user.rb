class RenamePostCounterInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :PostCounter, :posts_counter
  end
end

# rails db:migrate VERSION=20230525115504_rename_post_counter_in_user.rb
