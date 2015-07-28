require 'spec_helper'

describe "replies/index" do
  before(:each) do
    assign(:replies, [
      stub_model(Reply,
        :reply_to => "Reply To",
        :content => "Content"
      ),
      stub_model(Reply,
        :reply_to => "Reply To",
        :content => "Content"
      )
    ])
  end

  it "renders a list of replies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reply To".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
