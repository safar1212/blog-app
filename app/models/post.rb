class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'AuthorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'PostId'
  has_many :likes, class_name: 'Like', foreign_key: 'PostId'

  after_save :update_counter

  def update_counter
    user.increment!(:PostsCounter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end

  validates :Title, :presence, true, length: {maximum: 250}
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
