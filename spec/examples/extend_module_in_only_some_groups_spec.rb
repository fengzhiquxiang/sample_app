$:.unshift File.expand_path('..', __FILE__)
require 'helpers'

RSpec.configure do |c|
  c.extend Helpers, :foo => :bar
end

describe "an example group with matching metadata", :foo => :bar do
  puts "In a matching group, help is #{help}"

  it "does not have access to the helper methods defined in the module" do
    expect { help }.to raise_error(NameError)
  end

  it "why??????" do
    expect { help }.should eq(:available)
    # help.should be(:available)
  end
end

describe "an example group without matching metadata" do
  puts "In a non-matching group, help is #{help rescue 'not available'}"

  it "does not have access to the helper methods defined in the module" do
    expect { help }.to raise_error(NameError)
  end
end