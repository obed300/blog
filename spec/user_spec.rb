require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Obed Bamfo', photo: 'my picture', bio: 'This is about me', posts_counter: 23) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'brings last three posts for the user' do
    user = User.new(name: 'Mert', posts_counter: 0)
    user.save!

    user.posts.create!(title: 'Post 1', text: 'First post', likes_counter: 5, comments_counter: 2)
    user.posts.create!(title: 'Post 2', text: 'Second post', likes_counter: 5, comments_counter: 2)
    post3 = user.posts.create!(title: 'Post 3', text: 'Third post', likes_counter: 5, comments_counter: 2)
    post4 = user.posts.create!(title: 'Post 4', text: 'Fourth post', likes_counter: 5, comments_counter: 2)
    post5 = user.posts.create!(title: 'Post 5', text: 'Fifth post', likes_counter: 5, comments_counter: 2)

    expect(user.three_most_recent).to eq([post5, post4, post3])
  end
end
