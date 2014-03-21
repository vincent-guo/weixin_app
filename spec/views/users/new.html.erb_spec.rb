require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :subscribe => 1,
      :openid => "MyString",
      :nickname => "MyString",
      :sex => 1,
      :language => "MyString",
      :city => "MyString",
      :province => "MyString",
      :country => "MyString",
      :headimgurl => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_subscribe[name=?]", "user[subscribe]"
      assert_select "input#user_openid[name=?]", "user[openid]"
      assert_select "input#user_nickname[name=?]", "user[nickname]"
      assert_select "input#user_sex[name=?]", "user[sex]"
      assert_select "input#user_language[name=?]", "user[language]"
      assert_select "input#user_city[name=?]", "user[city]"
      assert_select "input#user_province[name=?]", "user[province]"
      assert_select "input#user_country[name=?]", "user[country]"
      assert_select "input#user_headimgurl[name=?]", "user[headimgurl]"
    end
  end
end
