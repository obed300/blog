class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments
  def update_post_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
