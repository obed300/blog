require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET all posts for the user' do
    it 'checks whether it brings successful response' do
      get user_posts_path(:user_id)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get user_posts_path(:user_id)
      expect(response).to render_template(:index)
    end

    it 'displays the body paragraph for users' do
      get user_posts_path(:user_id)
      expect(response.body).to include(' <h1>Route for list of post</h1>')
    end
  end
end
