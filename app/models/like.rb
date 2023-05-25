class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts, foreign_key: :post_id

  def update_like_counter
    post.increment(:like_counter)
  end
end
