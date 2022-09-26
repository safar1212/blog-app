class Comment < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'PostId'

  after_save :update_post_comments_count

  def update_post_comments_count
    post.increment!(:CommentsCounter)
  end
end
