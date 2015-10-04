describe Array do
  def prepared_array
	  [1,2,3] 
  end

  subject { prepared_array }
  
  describe "with some elements" do
    it "should have the prescribed elements" do
      subject.should == [1,2,3]
    end
  end
end