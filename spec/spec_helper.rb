require "serverspec"
require "infrataster/rspec"

# Execute Serverspec commands locally
set :backend, :exec

# Define a server for Infrataster
Infrataster::Server.define(:localhost, '127.0.0.1')

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
