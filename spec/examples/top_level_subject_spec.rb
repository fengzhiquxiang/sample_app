describe Array, "with some elements" do
  subject { [1,2,3] }
  it "should have the prescribed elements" do
    subject.should == [1,2,3]
  end
end