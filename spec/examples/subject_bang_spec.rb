describe Array do
  describe '#pop' do
    let(:prepared_array) { [1,2,3] }
    subject! { prepared_array.pop }
    it "removes the last value from the array" do
      prepared_array.should eq([1,2])
    end
    it "returns the last value of the array" do
      subject.should eq(3)
    end
  end
end
