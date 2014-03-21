require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :card_name => "MyString",
      :card_logo => "MyString",
      :card_publisher => "MyString",
      :shops_maxcount => 1,
      :card_intro => "MyText",
      :website => "MyString"
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_card_name[name=?]", "card[card_name]"
      assert_select "input#card_card_logo[name=?]", "card[card_logo]"
      assert_select "input#card_card_publisher[name=?]", "card[card_publisher]"
      assert_select "input#card_shops_maxcount[name=?]", "card[shops_maxcount]"
      assert_select "textarea#card_card_intro[name=?]", "card[card_intro]"
      assert_select "input#card_website[name=?]", "card[website]"
    end
  end
end
