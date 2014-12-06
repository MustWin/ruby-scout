# -*- encoding: utf-8 -*-
#require File.expand_path('../lib/instagram/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'scoutmetrics'
  s.version = '0.1.1'
  s.date = '2014-10-20'
  s.summary = 'Ruby wrapper for the Scout Metrics API'
  s.description = 'Ruby wrapper for the Scout Metrics API'
  s.authors = ['Dosty Everts']
  s.email = 'dosty@mustwin.com'
  #s.files = %w(lib/scoutmetrics.rb lib/scoutmetrics/configuration.rb lib/scoutmetrics/engagement.rb lib/scoutmetrics/request.rb lib/scoutmetrics/user.rb)
  s.files = `git ls-files`.split("\n")
  s.homepage = 'https://github.com/MustWin/scoutmetrics-ruby-gem'
  s.license = 'MIT'
  #s.add_development_dependency('rake', '~> 0.9.2.2')
  s.add_dependency 'http', '~> 0.6.0'
  s.add_dependency 'http_parser.rb', '~> 0.6.0'
  
  
  
  #s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  #s.files = `git ls-files`.split("\n")
  
  
  
  #s.platform = Gem::Platform::RUBY
  #s.require_paths = ['lib']
  #s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if s.respond_to? :required_rubygems_version=
  #s.rubyforge_project = s.name
  
  
end