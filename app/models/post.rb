class Post < ActiveRecord::Base
  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'PostId'
  has_many :likes, class_name: 'Like', foreign_key: 'PostId'

  def post_counter_updater
    user.post_counter = user.posts.count
    User.find(user.id).update(post_counter: user.posts.count)
  end

  def last_five_comments
    comments.last(5)
  end
end
