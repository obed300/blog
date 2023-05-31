require 'rails_helper'

RSpec.describe "holders/edit", type: :view do
  let(:holder) {
    Holder.create!(
      first_name: "MyString",
      last_name: "MyString"
    )
  }

  before(:each) do
    assign(:holder, holder)
  end

  it "renders the edit holder form" do
    render

    assert_select "form[action=?][method=?]", holder_path(holder), "post" do

      assert_select "input[name=?]", "holder[first_name]"

      assert_select "input[name=?]", "holder[last_name]"
    end
  end
end
