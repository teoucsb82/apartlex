require 'spec_helper'

describe "properties/edit" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :account_id => 1
    ))
  end

  it "renders the edit property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", property_path(@property), "post" do
      assert_select "input#property_street[name=?]", "property[street]"
      assert_select "input#property_city[name=?]", "property[city]"
      assert_select "input#property_state[name=?]", "property[state]"
      assert_select "input#property_zip[name=?]", "property[zip]"
      assert_select "input#property_account_id[name=?]", "property[account_id]"
    end
  end
end
