require "rspec/expectations"

RSpec.configure do |config|
  config.before(:each) do
    @before_each = "before each"
  end
  config.before(:all) do
    @before_all = "before all"
  end
end

describe "stuff in before blocks" do
  describe "with :all" do
    it "should be available in the example" do
      @before_all.should eq("before all")
    end
  end
  describe "with :each" do
    it "should be available in the example" do
      @before_each.should eq("before each")
    end
  end
end