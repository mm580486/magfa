
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "magfa/version"

Gem::Specification.new do |spec|
  spec.name          = "magfa"
  spec.version       = Magfa::VERSION
  spec.authors       = ["Mohammad Mahmoodi"]
  spec.email         = ["mm580486@gmail.com"]

  spec.summary       = %q{Magfa Wrapper}
  spec.description   = %q{Magfa webService}
  spec.homepage      = "https://github.com/mm580486/magfa"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"  
  spec.add_dependency "json"
  spec.add_dependency "feedjira"
  spec.add_dependency "validatable",'~> 1.6'
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
