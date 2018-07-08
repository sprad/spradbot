require 'dotenv/load'
require 'vcr'
require 'webmock'

require 'spradbot'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock

  %w[
    DARKSKY_TOKEN
    SLACK_BOT_TOKEN
  ].each do |token|
    config.filter_sensitive_data("<#{token}>") { ENV[token] }
  end
end
