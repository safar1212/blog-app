class Post < ActiveRecord::Base
  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'PostId'
  has_many :likes, class_name: 'Like', foreign_key: 'PostId'

  after_save :update_user_posts_count

  def five_recent_comments
    comments.last(5)
  end

  private

  def update_user_posts_count
    user.increment!(:PostsCounter)
  end

end
