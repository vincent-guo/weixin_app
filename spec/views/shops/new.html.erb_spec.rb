require 'spec_helper'

describe "shops/new" do
  before(:each) do
    assign(:shop, stub_model(Shop,
      :shop_name => "MyString",
      :shop_logo => "MyString",
      :phone => "MyString",
      :category => "MyString",
      :province => "MyString",
      :city => "MyString",
      :district => "MyString",
      :address => "MyString",
      :lat => 1.5,
      :lng => 1.5,
      :website => "MyString",
      :card_type => "MyString",
      :business_id => 1
    ).as_new_record)
  end

  it "renders new shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shops_path, "post" do
      assert_select "input#shop_shop_name[name=?]", "shop[shop_name]"
      assert_select "input#shop_shop_logo[name=?]", "shop[shop_logo]"
      assert_select "input#shop_phone[name=?]", "shop[phone]"
      assert_select "input#shop_category[name=?]", "shop[category]"
      assert_select "input#shop_province[name=?]", "shop[province]"
      assert_select "input#shop_city[name=?]", "shop[city]"
      assert_select "input#shop_district[name=?]", "shop[district]"
      assert_select "input#shop_address[name=?]", "shop[address]"
      assert_select "input#shop_lat[name=?]", "shop[lat]"
      assert_select "input#shop_lng[name=?]", "shop[lng]"
      assert_select "input#shop_website[name=?]", "shop[website]"
      assert_select "input#shop_card_type[name=?]", "shop[card_type]"
      assert_select "input#shop_business_id[name=?]", "shop[business_id]"
    end
  end
end
