# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecov/stdout/version'

Gem::Specification.new do |spec|
  spec.name          = 'simplecov-stdout'
  spec.version       = Simplecov::Stdout::VERSION
  spec.authors       = ['Lance Ivy']
  spec.email         = ['lance@cainlevy.net']

  spec.summary       = 'A SimpleCov formatter that prints actionable feedback directly to stdout.'
  spec.homepage      = 'https://github.com/cainlevy/simplecov-stdout'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){|f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_dependency 'command_line_reporter'

  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
