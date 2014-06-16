require 'rails_helper'

RSpec.describe "options/show", :type => :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :key => "Key",
      :value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/MyText/)
  end
end
