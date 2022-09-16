# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   commenter = Comment.new(AuthorId: 2, PostId: 3, Text: 'I like your new feature')

#   before { commenter.save }
#   it 'is valid with valid attributes' do
#     expect(commenter).to be_valid
#   end

#   it 'is not valid without an AuthorId' do
#     commenter.AuthorId = nil
#     expect(commenter).to be_valid
#   end

#   it 'is not valid without a post_id' do
#     commenter.PostId = nil
#     expect(commenter).to_not be_valid
#   end

#   it 'is not valid without a text' do
#     commenter.Text = nil
#     expect(commenter).to_not be_valid
#   end
# end