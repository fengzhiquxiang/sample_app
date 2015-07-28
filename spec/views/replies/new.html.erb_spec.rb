require 'spec_helper'

describe "replies/new" do
  before(:each) do
    assign(:reply, stub_model(Reply,
      :reply_to => "MyString",
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", replies_path, "post" do
      assert_select "input#reply_reply_to[name=?]", "reply[reply_to]"
      assert_select "input#reply_content[name=?]", "reply[content]"
    end
  end
end
