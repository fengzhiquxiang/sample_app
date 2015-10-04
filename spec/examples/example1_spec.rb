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

describe "mocking with RSpec" do
  it "fails when it should" do
    receiver = double('receiver')
    receiver.should_receive(:message)
  end
end

describe "passing message expectation in a pending block" do
  it "fails with FIXED" do
    pending do
      receiver = double('receiver')
      receiver.should_receive(:message)
      receiver.message
    end
  end
end

describe "RSpec.configuration.mock_framework.framework_name" do
  it "returns :rspec" do
    RSpec.configuration.mock_framework.framework_name.should eq(:rspec)
  end
end