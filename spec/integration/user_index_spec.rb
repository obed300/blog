require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 5
    )

    @user2 = User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Poland.',
      posts_counter: 1
    )
  end


  scenario 'Displaying user information' do
    visit root_path

    # Test: Display username of all other users
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)

    # Test: Display profile picture for each user
    expect(page).to have_css("img[src='#{@user1.photo}']")
    expect(page).to have_css("img[src='#{@user2.photo}']")

    # Test: Display number of posts each user has written
    # expect(page).to have_content('Number of posts 5')
    expect(page).to have_content("Number of posts #{@user1.posts_counter}")
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user2.posts_counter)
  end
end
