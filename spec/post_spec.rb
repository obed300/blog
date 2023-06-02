require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Obed Bamfo', text: 'my picture', comments_counter: 4, likes_counter: 23) }

  before { subject.save }

  it 'title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    subject.title = 'abc' * 250
    expect(subject).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end
end
