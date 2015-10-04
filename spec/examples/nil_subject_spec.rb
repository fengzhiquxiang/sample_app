describe Array do
  describe "#[]" do
    context "with index out of bounds" do
      before { Array.should_receive(:one_two_three).once.and_return([1,2,3]) }
      subject { Array.one_two_three[42] }
      it { should be_nil }
    end
  end
end