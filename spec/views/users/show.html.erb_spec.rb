require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :subscribe => 1,
      :openid => "Openid",
      :nickname => "Nickname",
      :sex => 2,
      :language => "Language",
      :city => "City",
      :province => "Province",
      :country => "Country",
      :headimgurl => "Headimgurl"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Openid/)
    rendered.should match(/Nickname/)
    rendered.should match(/2/)
    rendered.should match(/Language/)
    rendered.should match(/City/)
    rendered.should match(/Province/)
    rendered.should match(/Country/)
    rendered.should match(/Headimgurl/)
  end
end
