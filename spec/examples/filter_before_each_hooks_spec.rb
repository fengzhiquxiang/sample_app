RSpec.configure do |config|
  config.before(:each, :foo => :bar) do
    invoked_hooks << :before_each_foo_bar
  end
end

describe "a filtered before :each hook" do
  let(:invoked_hooks) { [] }

  describe "group without matching metadata" do
    it "does not run the hook" do
      invoked_hooks.should be_empty
    end

    it "runs the hook for an example with matching metadata", :foo => :bar do
      invoked_hooks.should == [:before_each_foo_bar]
    end
  end

  describe "group with matching metadata", :foo => :bar do
    it "runs the hook" do
      invoked_hooks.should == [:before_each_foo_bar]
    end
  end
end