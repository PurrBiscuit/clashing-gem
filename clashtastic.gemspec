# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'clashtastic'
  spec.version       = '0.0.1'
  spec.authors       = ['Steve Purr']
  spec.email         = ['spurr@articulate.com']
  spec.description   = %q{Query Clash of Clans API}
  spec.summary       = %q{Query Clash of Clans API}
  spec.homepage      = 'https://github.com/PurrBiscuit/clashtastic'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty'
  spec.add_development_dependency 'pry'
end