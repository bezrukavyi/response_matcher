
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'response_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'response_matcher'
  spec.version       = ResponseMatcher::VERSION
  spec.authors       = ['bezrukavyi']
  spec.email         = ['yaroslav.bezrukavyi@gmail.com']

  spec.summary       = 'Response Matcher'
  spec.description   = 'Response Matcher'
  spec.homepage      = 'https://github.com/bezrukavyi/response_matcher'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-configurable', '~> 0.7'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.50.0'
end
