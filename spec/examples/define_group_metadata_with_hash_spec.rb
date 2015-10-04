describe "a group with user-defined metadata", :foo => 17 do
  it 'has access to the metadata in the example' do
    example.metadata[:foo].should eq(17)
  end

  it 'does not have access to metadata defined on sub-groups' do
    example.metadata.should_not include(:bar)
  end

  describe 'a sub-group with user-defined metadata', :bar => 12 do
    it 'has access to the sub-group metadata' do
      example.metadata[:foo].should eq(17)
    end

    it 'also has access to metadata defined on parent groups' do
      example.metadata[:bar].should eq(12)
    end
  end
end

describe "a group with no user-defined metadata" do
  it 'has an example with metadata', :foo => 17 do
    example.metadata[:foo].should eq(17)
    example.metadata.should_not include(:bar)
  end

  it 'has another example with metadata', :bar => 12, :bazz => 33 do
    example.metadata[:bar].should eq(12)
    example.metadata[:bazz].should eq(33)
    example.metadata.should_not include(:foo)
  end
end