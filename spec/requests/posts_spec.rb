require 'rails_helper'

RSpec.describe 'GET posts/', type: :request do
  let(:user) { User.create!(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'Hello, I am John Doe', posts_counter: 5) }
  let(:post) { Post.create!(title: 'First Post', author_id: user.id, comments_counter: 3, likes_counter: 5) }

  it 'returns http status ok for /users/:id/posts' do
    get user_posts_path(user.id)
    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end

  it 'renders the index template for posts controller' do
    get user_posts_path(user.id)
    expect(response).to render_template(:index)
  end

  it 'displays index content for posts controller' do
    get user_posts_path(user.id)
    expect(response.body).to include('Number of posts')
  end
end

RSpec.describe 'GET /user/:id/posts/', type: :request do
  let(:user) { User.create!(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'Hello, I am John Doe', posts_counter: 5) }
  let(:post) { Post.create!(title: 'First Post', author_id: user.id, comments_counter: 3, likes_counter: 5) }

  it ' returns http status ok for /user/:id/posts/:id' do
    get user_posts_path(user.id)
    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end

  it 'renders the show template' do
    get user_post_path(user.id, post.id)
    expect(response).to render_template(:show)
  end

  it 'displays show content for user post' do
    get user_post_path(user.id, post.id)
    expect(response.body).to include('Comments:')
  end
end
