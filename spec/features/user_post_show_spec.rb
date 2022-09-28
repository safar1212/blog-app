require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'show page' do
    before(:each) do
      @user = User.create(Name: 'Tom', Bio: 'Software Developer', Photo: 'http://hello.com/org.png', PostsCounter: 0)
      @post = Post.create(Title: 'one post', Text: 'first post', user_id: @user.id, CommentsCounter: 0,
                          LikesCounter: 0)
      @post_one = Post.create(Title: 'two post', Text: 'second post', user_id: @user.id, CommentsCounter: 0,
                              LikesCounter: 0)
      @post_two = Post.create(Title: 'three post', Text: 'third post', user_id: @user.id, CommentsCounter: 0,
                              LikesCounter: 0)
      Comment.create(Text: 'welcome to the city', user_id: @user.id, PostId: @post_one.id)
      Comment.create(Text: 'This movie is good', user_id: @user.id, PostId: @post_one.id)
      Comment.create(Text: 'I love Pakistan', user_id: @user.id, PostId: @post_two.id)
      Like.create(PostId: @post.id, user_id: @user.id)
      Like.create(PostId: @post_one.id, user_id: @user.id)
      Like.create(PostId: @post_two.id, user_id: @user.id)
    end

    it 'I can see who wrote the post.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Tom')
    end

    it "I can see the post's title." do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('one post')
    end

    it 'I can see the post body.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('first post')
    end

    it 'I can see how many comments a post has.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Comments: 0')
    end

    it 'I can see how many likes it has.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'I can see the username of each commentor.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Tom')
    end

    it 'I can see the comment each commentor left.' do
      visit user_post_path(@user.id, @post_one.id)
      expect(page).to have_content('welcome to the city')
    end
  end
end
