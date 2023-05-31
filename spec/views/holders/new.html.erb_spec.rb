require 'rails_helper'

RSpec.describe "holders/new", type: :view do
  before(:each) do
    assign(:holder, Holder.new(
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders new holder form" do
    render

    assert_select "form[action=?][method=?]", holders_path, "post" do

      assert_select "input[name=?]", "holder[first_name]"

      assert_select "input[name=?]", "holder[last_name]"
    end
  end
end
