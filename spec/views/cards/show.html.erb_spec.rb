require 'spec_helper'

describe "cards/show" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :card_name => "Card Name",
      :card_logo => "Card Logo",
      :card_publisher => "Card Publisher",
      :shops_maxcount => 1,
      :card_intro => "MyText",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Card Name/)
    rendered.should match(/Card Logo/)
    rendered.should match(/Card Publisher/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Website/)
  end
end
