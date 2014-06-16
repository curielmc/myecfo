require 'rails_helper'

RSpec.describe "options/new", :type => :view do
  before(:each) do
    assign(:option, Option.new(
      :key => "MyString",
      :value => "MyText"
    ))
  end

  it "renders new option form" do
    render

    assert_select "form[action=?][method=?]", options_path, "post" do

      assert_select "input#option_key[name=?]", "option[key]"

      assert_select "textarea#option_value[name=?]", "option[value]"
    end
  end
end
