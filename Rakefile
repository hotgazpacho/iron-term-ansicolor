require 'rubygems'
require 'rake'
require 'fileutils'
require 'rake/rdoctask'
require 'lib/iron-term-ansicolor'
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end


task :default => :spec


##############################################################################
# OPTIONS
##############################################################################

PKG_NAME      = 'iron-term-ansicolor'
PKG_VERSION   = if File.exist?('VERSION.yml')
  config = YAML.load(File.read('VERSION.yml'))
  version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
else
  version = IronTermAnsiColor::Version::STRING
end
PKG_PLATFORM  = Gem::Platform.new(["universal", ".net"])
AUTHORS       = ['Will Green', 'David Blackmon', 'Ivan Porto Carrero', 'Danny Coates']
EMAIL         = "will@hotgazpacho.org"
HOMEPAGE      = "http://github.com/hotgazpacho/iron-term-ansicolor"
SUMMARY       = "iron-term-ansicolor brings color output to IronRuby on Windows"

# These are the common rdoc options that are shared between generation of
# rdoc files using BOTH 'rake rdoc' and the installation by users of a
# RubyGem version which builds rdoc's along with its installation.  Any
# rdoc options that are ONLY for developers running 'rake rdoc' should be
# added in the 'Rake::RDocTask' block below.
RDOC_OPTIONS  = [
                "--quiet",
                "--title", SUMMARY,
                "--main", "README.rdoc",
                "--line-numbers"
                ]

# Extra files outside of the lib dir that should be included with the rdocs.
RDOC_FILES    = (%w( README.rdoc)).sort

# The full file list used for rdocs, tarballs, gems, and for generating the xmpp4r.gemspec.
PKG_FILES     = (%w( Rakefile iron-term-ansicolor.gemspec ) + RDOC_FILES + Dir["{lib,spec}/**/*"]).sort

TEST_FILES    = Dir["spec/**/*"].sort

# RDOC
#######
Rake::RDocTask.new do |rd|

  # which dir should rdoc files be installed in?
  rd.rdoc_dir = 'rdoc'
  rd.title = "iron-term-ansicolor #{PKG_VERSION}"
  
  # the full list of files to be included
  rd.rdoc_files.include('README*')
  rd.rdoc_files.include(RDOC_FILES, "lib/**/*.rb")

  # the full list of options that are common between gem build
  # and 'rake rdoc' build of docs.
  rd.options = RDOC_OPTIONS

  # Devs Only : Uncomment to also document private methods in the rdocs
  # Please don't check this change in to the source repo.
  #rd.options << '--all'

  # Devs Only : Uncomment to generate dot (graphviz) diagrams along with rdocs.
  # This requires that graphiz (dot) be installed as a local binary and on your path.
  # See : http://www.graphviz.org/
  # Please don't check this change in to the source repo as it introduces a binary dependency.
  #rd.options << '--diagram'
  #rd.options << '--fileboxes'

end

begin
 require 'jeweler'
 Jeweler::Tasks.new do |gem|
   gem.name = PKG_NAME
   gem.summary = SUMMARY
   gem.description = SUMMARY
   gem.email = EMAIL
   gem.homepage = HOMEPAGE 
   gem.authors = AUTHORS
   gem.platform = PKG_PLATFORM
   gem.required_ruby_version = ">= 1.8.6" 
   gem.add_dependency 'term-ansicolor', ">= 1.0.4"
   gem.add_development_dependency 'rspec'
   gem.files = PKG_FILES
   gem.test_files = TEST_FILES
   gem.has_rdoc = true
   gem.extra_rdoc_files = RDOC_FILES
   gem.rdoc_options = RDOC_OPTIONS
   # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
 end
 Jeweler::GemcutterTasks.new 
rescue LoadError
 puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

