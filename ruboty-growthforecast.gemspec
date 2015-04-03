# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/growthforecast/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-growthforecast"
  spec.version       = Ruboty::Growthforecast::VERSION
  spec.authors       = ["mzp"]
  spec.email         = ["mzpppp@gmail.com"]

  spec.summary       = "Ruboty plugin for growthforecast"
  spec.description   = "Ruboty plugin for growthforecast"
  spec.homepage      = "http://github.com/mzp/ruboty-growthforecast"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "growthforecast"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
