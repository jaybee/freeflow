# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freeflow/version'

Gem::Specification.new do |spec|
  spec.name          = "freeflow"
  spec.version       = Freeflow::VERSION
  spec.authors       = ["Jonathan Barrett"]
  spec.email         = ["jonathan@freeagent.com"]

  spec.summary       = %q{A simple filter configuration manager for nanoc.}
  spec.homepage      = "https://github.com/jaybee/freeflow"
end
