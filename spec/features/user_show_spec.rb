require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'show page' do
    before(:each) do
      @user =
        User.create(
          Name: 'Tom',
          Bio: 'Software Developer',
          Photo: 'http://hello.com/org.png',
          PostsCounter: 0
        )
      @post = Post.create(Title: 'one post', Text: 'first post', user_id: @user.id, CommentsCounter: 0,
                          LikesCounter: 0)
      @post_one = Post.create(Title: 'two post', Text: 'second post', user_id: @user.id, CommentsCounter: 0,
                              LikesCounter: 0)
      @post_two = Post.create(Title: 'three post', Text: 'third post', user_id: @user.id, CommentsCounter: 0,
                              LikesCounter: 0)
    end

    it "has users's profile picture." do
      visit user_path(@user.id)
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/org.png')]")
    end

    it "has users's username." do
      visit user_path(@user.id)
      expect(page).to have_content('Tom')
    end

    it "has users's bio." do
      visit user_path(@user.id)
      expect(page).to have_content('Software Developer')
    end

    it 'has users number of posts' do
      visit user_path(@user.id)
      expect(page).to have_content('Number of posts: 3')
    end

    it 'has link to all posts' do
      visit user_path(@user.id)
      expect(page).to have_selector(:link_or_button, 'See all posts')
    end

    it 'has recent three posts' do
      visit user_path(@user.id)
      expect(page).to have_content('one post')
      expect(page).to have_content('second post')
      expect(page).to have_content('third post')
    end

    it 'redirects to user post show page' do
      visit user_posts_path(@user.id)
      expect(page).to have_current_path user_posts_path(@user.id)
    end

    it 'redirects to all user posts page' do
      visit user_path(@user.id)
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user.id)
    end
  end
end
