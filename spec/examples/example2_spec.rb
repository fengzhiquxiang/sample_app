RSpec.configure do |config|
  config.mock_framework = :flexmock
end

describe "mocking with Flexmock" do
  it "passes when it should" do
    receiver = flexmock('receiver')
    receiver.should_receive(:message).once
    receiver.message
  end
end