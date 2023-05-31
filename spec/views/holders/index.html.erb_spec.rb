require 'rails_helper'

RSpec.describe "holders/index", type: :view do
  before(:each) do
    assign(:holders, [
      Holder.create!(
        first_name: "First Name",
        last_name: "Last Name"
      ),
      Holder.create!(
        first_name: "First Name",
        last_name: "Last Name"
      )
    ])
  end

  it "renders a list of holders" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
  end
end
