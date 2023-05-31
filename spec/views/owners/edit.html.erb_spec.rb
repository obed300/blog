require 'rails_helper'

RSpec.describe "owners/edit", type: :view do
  let(:owner) {
    Owner.create!(
      first_name: "MyString",
      last_name: "MyString"
    )
  }

  before(:each) do
    assign(:owner, owner)
  end

  it "renders the edit owner form" do
    render

    assert_select "form[action=?][method=?]", owner_path(owner), "post" do

      assert_select "input[name=?]", "owner[first_name]"

      assert_select "input[name=?]", "owner[last_name]"
    end
  end
end
