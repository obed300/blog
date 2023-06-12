class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 0..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments

  after_create :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
