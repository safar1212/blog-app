class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'

  before_validation :default_values

  def three_recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  validates :Name, presence: true
  validates :PostsCounter, numericality: { greater_than_or_equal_to: 0 }

  private

  def default_values
    self.PostsCounter = 0
    self.Photo = 'https://img.myloview.com/posters/social-media-user-icon-default-avatar-profile-image-400-251200036.jpg'
  end
end
