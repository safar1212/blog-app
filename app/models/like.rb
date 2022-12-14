class Like < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_counter

  def update_counter
    post.increment!(:LikesCounter)
  end
end
