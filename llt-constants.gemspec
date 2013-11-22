# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'llt/constants/version'

Gem::Specification.new do |spec|
  spec.name          = "llt-constants"
  spec.version       = LLT::Constants::VERSION
  spec.authors       = ["LFDM", "lichtr"]
  spec.email         = ["1986gh@gmail.com", "robert.lichtensteiner@gmail.com"]
  spec.description   = %q{LLT Constants Package.}
  spec.summary       = %q{LLT Constants Package. Collections of latin endings, markers etc.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov", "~> 0.7"
  spec.add_development_dependency "yard"
end
