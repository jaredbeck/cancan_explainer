# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cancan_explainer/version'

Gem::Specification.new do |spec|
  spec.name = "cancan_explainer"
  spec.version = CanCanExplainer.gem_version.to_s
  spec.authors = ["Jared Beck"]
  spec.email = ["jared@jaredbeck.com"]
  spec.summary = "Troubleshoot cancan rules"
  spec.license = "LGPL-3.0"
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r(^spec/)) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.2.0"
  spec.add_runtime_dependency "cancancan", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "byebug", "~> 9.0"
  spec.add_development_dependency "rspec", "~> 3.6"
end
