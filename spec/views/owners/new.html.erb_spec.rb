require 'rails_helper'

RSpec.describe "owners/new", type: :view do
  before(:each) do
    assign(:owner, Owner.new(
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders new owner form" do
    render

    assert_select "form[action=?][method=?]", owners_path, "post" do

      assert_select "input[name=?]", "owner[first_name]"

      assert_select "input[name=?]", "owner[last_name]"
    end
  end
end
