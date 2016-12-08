# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nmax/version'

Gem::Specification.new do |spec|
  spec.name          = "nmax"
  spec.version       = Nmax::VERSION
  spec.authors       = ["Ilya Manin"]
  spec.email         = ["bkmzvf@gmail.com"]

  spec.summary       = %q{Print n biggest numbers from stdin}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "bin"
  spec.executables   = ["nmax"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",                    "~> 1.13"
  spec.add_development_dependency "codeclimate-test-reporter",  "~> 1.0.0"
  spec.add_development_dependency "minitest",                   "~> 5.0"
  spec.add_development_dependency "rake",                       "~> 11.0"
  spec.add_development_dependency "simplecov",                  "~> 0.12"
end
