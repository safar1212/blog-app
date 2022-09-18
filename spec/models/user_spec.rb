require 'rails_helper'

RSpec.describe User, type: :model do
  author = User.new(Name: 'John Doe', Photo: 'https://example.com/photo.jpg', Bio: 'he was born in 1990 in England',
                    PostsCounter: 15)

  before { author.save }

  it 'is valid with valid attributes' do
    expect(author).to be_valid
  end

  it 'is not valid without a name' do
    author.Name = nil
    expect(author).to_not be_valid
  end

  it 'is not valid without a photo' do
    author.Photo = nil
    expect(author).to_not be_valid
  end

  it 'is not valid without a bio' do
    author.Bio = nil
    expect(author).to_not be_valid
  end

  it 'is not valid without a posts_counter' do
    author.PostsCounter = nil
    expect(author).to_not be_valid
  end

  it 'is not valid with a posts_counter less than 0' do
    author.PostsCounter = -1
    expect(author).to_not be_valid
  end

  it 'has last_three_posts with 3 posts' do
    expect(author.last_three_posts.count).to_not eq(3)
  end
end
