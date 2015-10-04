RSpec.configure do |config|
  config.before(:all, :foo => :bar) { @hook = :before_all_foo_bar }
end

describe "a filtered before(:all) hook" do
  describe "a group without matching metadata" do
    it "does not run the hook" do
      @hook.should be_nil
    end

    describe "a nested subgroup with matching metadata", :foo => :bar do
      it "runs the hook 1" do
        @hook.should == :before_all_foo_bar
      end
    end
  end

  describe "a group with matching metadata", :foo => :bar do
    it "runs the hook 2" do
      @hook.should == :before_all_foo_bar
    end

    describe "a nested subgroup" do
      it "runs the hook 3" do
        @hook.should == :before_all_foo_bar
      end
    end
  end
end