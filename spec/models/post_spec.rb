# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   poster = Post.new(AuthorId: 1, Title: 'My first post', Text: 'This is my first post', CommentsCounter: 12,
#                     LikesCounter: 9)

#   before { poster.save }
#   it 'is valid with valid attributes' do
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid without an user_id' do
#     poster.AuthorId = nil
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid without a title' do
#     poster.Title = nil
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid without a text' do
#     poster.Text = nil
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid without a comments_counter' do
#     poster.CommentsCounter = nil
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid without a likes_counter' do
#     poster.LikesCounter = nil
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid with a comments_counter less than 0' do
#     poster.CommentsCounter = -1
#     expect(poster).to_not be_valid
#   end

#   it 'is not valid with a likes_counter less than 0' do
#     poster.LikesCounter = -1
#     expect(poster).to_not be_valid
#   end
# end