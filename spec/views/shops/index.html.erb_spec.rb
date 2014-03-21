require 'spec_helper'

describe "shops/index" do
  before(:each) do
    assign(:shops, [
      stub_model(Shop,
        :shop_name => "Shop Name",
        :shop_logo => "Shop Logo",
        :phone => "Phone",
        :category => "Category",
        :province => "Province",
        :city => "City",
        :district => "District",
        :address => "Address",
        :lat => 1.5,
        :lng => 1.5,
        :website => "Website",
        :card_type => "Card Type",
        :business_id => 1
      ),
      stub_model(Shop,
        :shop_name => "Shop Name",
        :shop_logo => "Shop Logo",
        :phone => "Phone",
        :category => "Category",
        :province => "Province",
        :city => "City",
        :district => "District",
        :address => "Address",
        :lat => 1.5,
        :lng => 1.5,
        :website => "Website",
        :card_type => "Card Type",
        :business_id => 1
      )
    ])
  end

  it "renders a list of shops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shop Name".to_s, :count => 2
    assert_select "tr>td", :text => "Shop Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Card Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
