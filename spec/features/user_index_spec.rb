require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @user = User.create(
      Name: 'Safar',
      Bio: 'Software Developer',
      Photo: 'http://hello.com/org.png',
      PostsCounter: 0
    )

    @user_two = User.create(
      Name: 'Ali',
      Bio: 'Software Developer',
      Photo: 'http://hello.com/ogene.png',
      PostsCounter: 0
    )
  end

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Safar')
      expect(page).to have_content('Ali')
    end

    it 'should have the profile picture' do
      visit users_path
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/org.png')]")
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/ogene.png')]")
    end

    it 'should have number of users post' do
      visit users_path
      expect(page).to have_content('Total Posts: 0')
    end

    it 'should redirect to users show page' do
      visit user_path(@user.id)
      expect(page).to have_content('Safar')
      expect(page).to have_content('Software Developer')
    end
  end
end