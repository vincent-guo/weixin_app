require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :subscribe => 1,
        :openid => "Openid",
        :nickname => "Nickname",
        :sex => 2,
        :language => "Language",
        :city => "City",
        :province => "Province",
        :country => "Country",
        :headimgurl => "Headimgurl"
      ),
      stub_model(User,
        :subscribe => 1,
        :openid => "Openid",
        :nickname => "Nickname",
        :sex => 2,
        :language => "Language",
        :city => "City",
        :province => "Province",
        :country => "Country",
        :headimgurl => "Headimgurl"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Openid".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Headimgurl".to_s, :count => 2
  end
end
