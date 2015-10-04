RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.before(:each, :before_each) { puts "before each" }
  c.after(:each,  :after_each) { puts "after each" }
  c.around(:each, :around_each) do |example|
    puts "around each (before)"
    example.run
    puts "around each (after)"
  end
  c.before(:all, :before_all) { puts "before all" }
  c.after(:all,  :after_all) { puts "after all" }
end

describe "group 1", :before_all, :after_all do
  it("1") { puts "example 1" }
  it("2", :before_each) { puts "example 2" }
  it("3", :after_each) { puts "example 3" }
  it("4", :around_each) { puts "example 4" }
end