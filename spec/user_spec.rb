require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Obed Bamfo', photo: 'my picture', bio: 'This is about me', posts_counter: 23) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'must be an integer greater than or equal to zero' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end
end
