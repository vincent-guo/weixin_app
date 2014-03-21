require 'spec_helper'

describe "shops/show" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Shop Name/)
    rendered.should match(/Shop Logo/)
    rendered.should match(/Phone/)
    rendered.should match(/Category/)
    rendered.should match(/Province/)
    rendered.should match(/City/)
    rendered.should match(/District/)
    rendered.should match(/Address/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Website/)
    rendered.should match(/Card Type/)
    rendered.should match(/1/)
  end
end
