require 'spec_helper'

describe "subscriptions/edit" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :account => nil,
      :type_of => "MyString",
      :active => false
    ))
  end

  it "renders the edit subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do
      assert_select "input#subscription_account[name=?]", "subscription[account]"
      assert_select "input#subscription_type_of[name=?]", "subscription[type_of]"
      assert_select "input#subscription_active[name=?]", "subscription[active]"
    end
  end
end
