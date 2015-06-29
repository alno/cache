require File.expand_path('../lib/cache/version', __FILE__)

Gem::Specification.new do |s|
  s.platform      = Gem::Platform::RUBY
  s.name          = "cache"
  s.version       = Cache::VERSION
  s.authors       = ["Alexey Noskov"]
  s.email         = ["alexey.noskov@gmail.com"]
  s.summary       = %q{Interface for rails local caching}
  s.homepage      = ""
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3"
  s.add_dependency "hashie", ">= 3"

  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
