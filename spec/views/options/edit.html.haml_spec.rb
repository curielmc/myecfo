require 'rails_helper'

RSpec.describe "options/edit", :type => :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :key => "MyString",
      :value => "MyText"
    ))
  end

  it "renders the edit option form" do
    render

    assert_select "form[action=?][method=?]", option_path(@option), "post" do

      assert_select "input#option_key[name=?]", "option[key]"

      assert_select "textarea#option_value[name=?]", "option[value]"
    end
  end
end
