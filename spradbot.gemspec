lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spradbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'spradbot'
  spec.version       = Spradbot::VERSION
  spec.authors       = ['Justin Spradlin']
  spec.email         = ['justin.spradlin@cortexintel.com']

  spec.summary       = "Sprad's implementation of the Cortex homeork assignment"
  spec.homepage      = 'https://github.com/cortexintel/spradbot'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faye-websocket'
  spec.add_dependency 'forecast_io'
  spec.add_dependency 'slack-ruby-client'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
