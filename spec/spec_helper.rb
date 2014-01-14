require 'sort'

require 'rspec'

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :behaves_as, 'behaves as:'
end