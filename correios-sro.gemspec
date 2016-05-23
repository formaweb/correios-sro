# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'correios_sro/version'

Gem::Specification.new do |spec|
  spec.name          = "correios-sro"
  spec.version       = CorreiosSRO::VERSION
  spec.authors       = ["Caio Tarifa"]
  spec.email         = ["caio@formaweb.com.br"]
  spec.summary       = %q{Tracking object system from Correios (Brazil).}
  spec.description   = %q{Tracking object system from Correios (Brazil).}
  spec.homepage      = "https://github.com/formaweb/correios-sro"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
