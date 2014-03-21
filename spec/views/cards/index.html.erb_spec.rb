require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card,
        :card_name => "Card Name",
        :card_logo => "Card Logo",
        :card_publisher => "Card Publisher",
        :shops_maxcount => 1,
        :card_intro => "MyText",
        :website => "Website"
      ),
      stub_model(Card,
        :card_name => "Card Name",
        :card_logo => "Card Logo",
        :card_publisher => "Card Publisher",
        :shops_maxcount => 1,
        :card_intro => "MyText",
        :website => "Website"
      )
    ])
  end

  it "renders a list of cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Card Name".to_s, :count => 2
    assert_select "tr>td", :text => "Card Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Card Publisher".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
