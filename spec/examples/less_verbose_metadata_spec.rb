RSpec.configure do |c|
  c.filter_run_including :focus => true
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

describe "a group with simple metadata", :fast, :simple, :bug => 73 do
  it 'has :fast => true metadata' do
    example.metadata[:fast].should == true
  end

  it 'has :simple => true metadata' do
    example.metadata[:simple].should == true
  end

  it 'can still use a hash for metadata' do
    example.metadata[:bug].should eq(73)
  end

  it 'can define simple metadata on an example', :special do
    example.metadata[:special].should == true
  end
end

require "spec_helper"

describe "something" do
  it "does one thing" do
  end

  it "does another thing", :focus => true do
  end
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.filter_run :current_example
end

describe "something 22" do
  it "does one thing" do
  end

  it "does another thing 22", :current_example do
  end
end