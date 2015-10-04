class Database
  def self.transaction
    puts "open transaction"
    yield
    puts "close transaction"
  end
end

describe "around filter" do
  around(:each) do |example|
    Database.transaction(&example)
  end

  it "gets run in order" do
    puts "run the example"
  end
end

describe "around hook" do
  around(:each) do |example|
    puts "around each before"
    example.run
    puts "around each after"
  end

  it "gets run in order" do
    puts "in the example"
  end

  it "gets run in order 2" do
    puts "in the example 2"
  end
end

describe "something" do
  around(:each) do |example|
    puts example.metadata[:foo]
    example.run
  end

  it "does something", :foo => "this should show up in the output" do
  end
end

RSpec.configure do |c|
  c.around(:each) do |example|
    puts "around each before"
    example.run
    puts "around each after"
  end
end

describe "around filter" do
  it "gets run in order ggggggggggggggg" do
    puts "in the example ggggggggggggg"
  end
end