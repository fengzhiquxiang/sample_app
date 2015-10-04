require "rspec/expectations"
# require 'minitest/autorun'
RSpec.configure do |config|
  config.expect_with :rspec
end
# RSpec.configure do |config|
#   config.expect_with :stdlib
# end
describe 9 do

  it "should be > 8" do
    9.should be > 8
  end

  it "should be < 10" do
    9.should be < 10
  end

  it "should be 3 squared" do
    9.should be 3*3
  end

end

class Person
  attr_reader :phone_numbers
  def initialize
    @phone_numbers = []
  end
end

describe Person do
  context "with one phone number (555-1212)"do
    subject do
      person = Person.new
      person.phone_numbers << "555-1212"
      person
    end

    its("phone_numbers.first") { should eq("555-1212") }
  end
end

require 'matrix'

describe Matrix do
  context "with values [[1, 2], [3, 4]]" do
    subject do
      Matrix[[1, 2], [3, 4]]
    end

    its([0, 1]) { should eq(2) }
    its([1, 0]) { should eq(3) }
    its([1, 2]) { should be_nil }
  end
end

describe Array do
  describe "when first created" do
    it { should be_empty }
  end
end

describe "an example" do
  it "knows itself as example" do
    example.description.should eq("knows itself as example")
  end
end

describe Fixnum do
  it "is available as described_class" do
    described_class.should eq(Fixnum)
  end
end

describe "color_enabled" do
  context "when set with RSpec.configure" do
    before do
      # color is disabled for non-tty output, so stub the output stream
      # to say it is tty, even though we're running this with cucumber
      RSpec.configuration.output_stream.stub(:tty?) { true }
    end

    it "is true" do
      RSpec.configuration.should be_color_enabled
    end
  end
end

require 'spec_helper'
describe "an example" do
  it "passes" do
    true
  end
end

# require "spec_helper"

describe "something" do
  it "sleeps for 0.1 secionds (example 1)" do
    sleep 0.1
    1.should == 1
  end

  it "sleeps for 0 seconds (example 2)" do
    2.should == 2
  end

  it "sleeps for 0.15 seconds (example 3)" do
    sleep 0.15
    3.should == 3
  end

  it "sleeps for 0.05 seconds (example 4)" do
    sleep 0.05
    4.should == 4
  end

  it "sleeps for 0.05 seconds (example 5)" do
    sleep 0.05
    5.should == 5
  end

  it "sleeps for 0.05 seconds (example 6)" do
    sleep 0.05
    6.should == 6
  end

  it "sleeps for 0.05 seconds (example 7)" do
    sleep 0.05
    7.should == 7
    end

  it "sleeps for 0.05 seconds (example 8)" do
    sleep 0.05
    8.should == 8
  end

  it "sleeps for 0.05 seconds (example 9)" do
    sleep 0.05
    9.should == 9
  end

  it "sleeps for 0.05 seconds (example 10)" do
    sleep 0.05
    10.should == 10
  end

  it "sleeps for 0.05 seconds (example 11)" do
    sleep 0.05
    11.should == 11
  end
end

describe "examples" do
  it "with some tag", :some_tag => true do
  end

  it "with no tag as well" do
  end
end

describe "fails" do
  pending "code will not be exercised", :ff => true do
    fail
  end
end

describe "fails" do
  it "code will be exercised", :ff => true do
    pending# { fail }
  end
end

describe "failed filtering" do
  it "this will be filted out", :my_tag do
    true
  end

  it "so will this" do
    false
  end
end

RSpec::Matchers.define :be_a_multiple_of do |factor|
  match do |actual|
    actual % factor == 0
  end
end

describe 6, :mm => true do
  it { should be_a_multiple_of(3) }
end



describe 5, :haha => true do
  it "is greater than 4" do
    5.should be > 4
  end
end



# describe 5, :hehe => true do
#   it "is greater than 4" do
#     assert 5 > 4, "expected 5 to be greater than 4"
#   end

#   specify { assert 5 < 6 }
# end

RSpec.configure do |config|
  config.mock_framework = :rspec
end

describe "mocking with RSpec", :hoho => true  do
  it "passes when it should" do
    receiver = double('receiver')
    receiver.should_receive(:message)
    receiver.message
  end
end