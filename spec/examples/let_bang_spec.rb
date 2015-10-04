$count = 0
describe "let!" do
  invocation_order = []

  let!(:count) do
    invocation_order << :let!
    $count += 1
  end

  it "calls the helper method in a before hook" do
    invocation_order << :example
    invocation_order.should == [:let!, :example]
    count.should eq(1)
  end
end