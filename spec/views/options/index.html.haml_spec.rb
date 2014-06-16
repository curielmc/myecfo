require 'rails_helper'

RSpec.describe "options/index", :type => :view do
  before(:each) do
    assign(:options, [
      Option.create!(
        :key => "Key",
        :value => "MyText"
      ),
      Option.create!(
        :key => "Key",
        :value => "MyText"
      )
    ])
  end

  it "renders a list of options" do
    render
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
