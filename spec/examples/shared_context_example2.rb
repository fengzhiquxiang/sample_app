$:.unshift(File.expand_path("..", __FILE__))
require "shared_stuff"

describe "group that includes a shared context using metadata", :a => :b do
  it "has access to methods defined in shared context" do
    shared_method.should eq("it works")
  end

  it "has access to methods defined with let in shared context" do
    shared_let['arbitrary'].should_not eq('object')
  end

  it "runs the before hooks defined in the shared context" do
    @some_var.should be(:some_value)
  end

  it "accesses the subject defined in the shared context 2" do
    subject.should eq('this is the subject')
  end
end