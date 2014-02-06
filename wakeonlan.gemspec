# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name         = "wakeonlan"
  s.version      = "1.0.0"
  s.author       = "Thomas Chester"
  s.email        = "tjchester@me.com"
  s.homepage     = "https://github.com/tjchester/wakeonlan/"
  s.summary      = "A script to send wake-on-lan packets to sleeping computers."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = ["wakeonlan"]
  s.rdoc_options  = ["--charset=utf-8"]

  s.required_ruby_version = '>=2.0'
  s.add_development_dependency 'rspec'
end
