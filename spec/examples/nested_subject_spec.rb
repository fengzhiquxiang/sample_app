class ArrayWithOneElement < Array
  def initialize(*)
    super
    unshift "first element"
  end
end

describe Array do
  describe ArrayWithOneElement do
    context "referenced as subject" do
      it "should be empty (because it is the Array declared at the top)" do
        subject.should be_empty
      end
    end

    context "created in the example" do
      it "should not be empty" do
        ArrayWithOneElement.new.should_not be_empty
      end
    end
  end
end