require 'rails_helper'
RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Hello there', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Magician from Spain', posts_counter: 5)

    @first_post = Post.create(title: 'Hello there', text: 'Excited about another post', author_id: @user.id)
    Comment.create(text: 'Hello', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'You good?', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'I hope so', author_id: @user.id, post_id: @first_post.id)

    @first_post.update(comments_counter: @first_post.comments.count)
    visit user_posts_path(@first_post.author, @first_post)
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'displays who wrote the post' do
    expect(page).to have_content(@user.name)
  end
  scenario 'displays number of comments' do
    expect(page).to have_content(@first_post.comments_counter)
  end

  scenario 'displays number of likes' do
    expect(page).to have_content(@first_post.likes_counter)
  end

  scenario 'displays comments' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'displays the username of each commentor' do
    expect(page).to have_content(@user.name)
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end
  scenario 'displays the comments left by each commentor' do
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
