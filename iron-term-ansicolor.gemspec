# WARNING : RAKE AUTO-GENERATED FILE.  DO NOT MANUALLY EDIT!
# RUN : 'rake gem:update_gemspec'

Gem::Specification.new do |s|
  s.authors = ["Will Green", "David Blackmon", "Ivan Porto Carrero", "Danny Coates"]
  s.bindir = "bin"
  s.add_dependency "term-ansicolor", ">= 1.0.4, runtime"
  s.add_dependency "rspec", ">= 0, development"
  s.description = "iron-term-ansicolor brings color output to IronRuby on Windows"
  s.email = "will@hotgazpacho.org"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc",
 "Rakefile",
 "iron-term-ansicolor.gemspec",
 "lib/iron-term-ansicolor.rb",
 "spec/iron-term-ansicolor_simple_background_spec.rb",
 "spec/iron-term-ansicolor_simple_foreground_spec.rb",
 "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = "http://github.com/hotgazpacho/iron-term-ansicolor"
  s.loaded = false
  s.name = "iron-term-ansicolor"
  s.platform = "universal-.net"
  s.rdoc_options = ["--quiet", "--title", "iron-term-ansicolor brings color output to IronRuby on Windows", "--main", "README.rdoc", "--line-numbers", "--format", "darkfish"]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 1.8.6"
  s.required_rubygems_version = ">= 0"
  s.rubyforge_project = "iron-term-ansicolor"
  s.rubygems_version = "1.3.5"
  s.specification_version = 3
  s.summary = "iron-term-ansicolor brings color output to IronRuby on Windows"
  s.test_files = ["spec/iron-term-ansicolor_simple_background_spec.rb", "spec/iron-term-ansicolor_simple_foreground_spec.rb", "spec/spec_helper.rb"]
  s.version = "0.0.3"
end