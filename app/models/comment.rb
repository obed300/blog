class Comment < ApplicationRecord
  belongs_to :posts, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter

  private

  def update_comments_counter
    posts.increment!(:comments_counter)
  end
end
