require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Obed Bamfo', Photo: 'my picture', Bio: 'This is about me', posts_counter: 23) }

  before { subject.save }

  it 'name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'must be an integer greater than or equal to zero' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end
end
