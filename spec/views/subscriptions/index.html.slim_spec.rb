require 'spec_helper'

describe "subscriptions/index" do
  before(:each) do
    assign(:subscriptions, [
      stub_model(Subscription,
        :account => nil,
        :type_of => "Type Of",
        :active => false
      ),
      stub_model(Subscription,
        :account => nil,
        :type_of => "Type Of",
        :active => false
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type Of".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
