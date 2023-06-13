require 'rails_helper'
RSpec.describe 'Renders users Show Page', type: :feature do
  before(:each) do
    # Create necessary objects for the tests, such as a user and their posts
    @user = User.create(name: 'James', photo: 'image.jpg', bio: 'Prefessor in French', posts_counter: 5)
    Post.create(author: @user, title: 'Hello mates', text: 'adipiscing elit sed eiusmod labore magna')
    Post.create(author: @user, title: 'Best Regards', text: 'tempor incididunt sit do labore consectetur')
    Post.create(author: @user, title: 'New Post', text: 'ipsum dolore et consectetur sit tempor')
    @post = Post.create(author: @user, title: 'One Post', text: 'I am getting anxious')
  end
  scenario 'Display user information' do
    visit user_path(@user.id)
    # Test: Display user's profile picture
    expect(page).to have_css("img[src*='image.jpg']")
    # Test: Display user's username
    expect(page).to have_content('James')
    # Test: Display number of posts the user has written
    expect(page).to have_content("Number of posts #{@user.posts_counter}")
    # Test: Display user's bio
    expect(page).to have_content('Prefessor in French')
    # Test: Display the user's first 3 posts
    expect(page).to have_content(@user.three_most_recent[0].text)
    expect(page).to have_content(@user.three_most_recent[1].text)
    expect(page).to have_content(@user.three_most_recent[2].text)
    expect(page).to have_no_content(Post.where(author: @user))
  end
  scenario 'View all posts button redirects to user posts index page' do
    visit user_path(@user)
    # Test: Clicking "See all posts" button redirects to the user's posts index page
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end
  scenario 'Clicking on a user post redirects to post show page' do
    visit user_path(@user)
    # Test: Clicking on a user's post redirects to the post's show page
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
