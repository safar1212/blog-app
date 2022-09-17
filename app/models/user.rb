class User <  ActiveRecord::Base
  validates :Name, presence: true
  validates :PostsCounter, numericality: { greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.last(3)
  end

  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'

end
