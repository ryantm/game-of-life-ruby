require 'life'
require 'rspec'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end

RSpec::Matchers.define :eq_world do |expected|
  match do |actual|
    actual == expected
  end
  failure_message_for_should do |actual|
    "expected that #{display(actual)} be the same world as #{display(expected)}"
  end
  failure_message_for_should_not do |actual|
    "expected that #{display(actual)} not be the same world as #{display(expected)}"
  end
  def display(array)
    "\n"+array.inspect.split("],").join("],\n")
  end
end
