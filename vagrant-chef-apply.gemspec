# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "vagrant-chef-apply"
  spec.version       = '0.0.1'
  spec.authors       = [ "Brian Akins" ]
  spec.email         = [ "brian@akins.org" ]
  spec.description   = %q{A Vagrant plugin to add simple chef-apply provisioner}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/bakins/vagrant-chef-apply"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 1.9.1"
end
