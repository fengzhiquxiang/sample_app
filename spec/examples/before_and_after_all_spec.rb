describe "before and after callbacks" do
  before(:all) do
    @outer_state = "set in outer before all"
  end

  example "in outer group" do
    @outer_state.should eq("set in outer before all")
  end

  describe "nested group" do
    before(:all) do
      @inner_state = "set in inner before all"
    end

    example "in nested group" do
      @outer_state.should eq("set in outer before all")
      @inner_state.should eq("set in inner before all")
    end

    after(:all) do
      @inner_state.should eq("set in inner before all")
    end
  end

  after(:all) do
    @outer_state.should eq("set in outer before all")
  end
end