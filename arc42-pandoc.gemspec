# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arc42/pandoc/version'

Gem::Specification.new do |spec|
  spec.name          = "arc42-pandoc"
  spec.version       = Arc42::Pandoc::VERSION
  spec.authors       = ["Stefan Neidig"]
  spec.email         = ["s.neidig@appcom-interactive.de"]

  spec.summary       = %q{This is a micro gem for creating arc42 markdown boilerplate code and for converting it to various formats using pandoc.}
  spec.description   = %q{This is a micro gem for creating arc42 markdown boilerplate code and for converting it to various formats using pandoc.}
  spec.homepage      = "https://github.com/dasheck0/arc42-pandoc"
  spec.license       = "Apache 2.0 License"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "gli", "2.14.0"
end
