require 'rubygems'
require 'rake'
require 'fileutils'
require 'rake/rdoctask'
require 'lib/iron-term-ansicolor'
begin
 require 'jeweler'
 Jeweler::Tasks.new do |gem|
   gem.name = "iron-term-ansicolor"
   gem.summary = %Q{TODO}
   gem.email = "will@hotgazpacho.org"
   gem.homepage = "http://github.com/hotgazpacho/iron-term-ansicolor"
   gem.authors = ["hotgazpacho","casualjim"]
   # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
 end

rescue LoadError
 puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

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
AUTHORS       = ['Will Green', 'David Blackmon', 'Ivan Porto Carrero']
EMAIL         = "will@hotgazpacho.org"
HOMEPAGE      = "http://github.com/hotgazpacho/iron-term-ansicolor"
SUMMARY       = "iron-term-ansicolor brings color output for RSpec and the likes to IronRuby."

# These are the common rdoc options that are shared between generation of
# rdoc files using BOTH 'rake rdoc' and the installation by users of a
# RubyGem version which builds rdoc's along with its installation.  Any
# rdoc options that are ONLY for developers running 'rake rdoc' should be
# added in the 'Rake::RDocTask' block below.
RDOC_OPTIONS  = [
                "--quiet",
                "--title", SUMMARY,
                "--main", "README.rdoc",
                "--line-numbers",
                "--format","darkfish"
                ]

# Extra files outside of the lib dir that should be included with the rdocs.
RDOC_FILES    = (%w( README.rdoc)).sort

# The full file list used for rdocs, tarballs, gems, and for generating the xmpp4r.gemspec.
PKG_FILES     = (%w( Rakefile iron-term-ansicolor.gemspec ) + RDOC_FILES + Dir["{lib,spec}/**/*"]).sort

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

##############################################################################
# PACKAGING & INSTALLATION
##############################################################################

# What files/dirs should 'rake clean' remove?
#CLEAN.include ["*.gem", "pkg", "rdoc", "coverage"]

begin
  require 'rake/gempackagetask'

  spec = Gem::Specification.new do |s|
    s.name = PKG_NAME
    s.version = PKG_VERSION
    s.authors = AUTHORS
    s.email = EMAIL
    s.homepage = HOMEPAGE
    s.rubyforge_project = PKG_NAME
    s.summary = SUMMARY
    s.description = s.summary
    s.platform = Gem::Platform::RUBY
    s.require_path = 'lib'
    s.executables = []
    s.files = PKG_FILES
    s.test_files = []
    s.has_rdoc = true
    s.extra_rdoc_files = RDOC_FILES
    s.rdoc_options = RDOC_OPTIONS
    s.required_ruby_version = ">= 1.8.6"  
    s.add_dependency 'term-ansicolor', ">= 1.0.4"
  end

  Rake::GemPackageTask.new(spec) do |pkg|
    pkg.gem_spec = spec
    pkg.need_tar = true
    pkg.need_zip = true
  end

  namespace :gem do

    desc "Run :package and install the .gem locally"
    task :install => [:update_gemspec, :package] do
      sh %{sudo gem install --local pkg/#{PKG_NAME}-#{PKG_VERSION}.gem}
    end

    desc "Like gem:install but without ri or rdocs"
    task :install_fast => [:update_gemspec, :package] do
      sh %{sudo gem install --local pkg/#{PKG_NAME}-#{PKG_VERSION}.gem --no-rdoc --no-ri}
    end

    desc "Run :clean and uninstall the .gem"
    task :uninstall => :clean do
      sh %{sudo gem uninstall #{PKG_NAME}}
    end

    # Thanks to the Merb project for this code.
    desc "Update Github Gemspec"
    task :update_gemspec do
      skip_fields = %w(new_platform original_platform date)

      result = "# WARNING : RAKE AUTO-GENERATED FILE.  DO NOT MANUALLY EDIT!\n"
      result << "# RUN : 'rake gem:update_gemspec'\n\n"
      result << "Gem::Specification.new do |s|\n"
      spec.instance_variables.sort.each do |ivar|
        value = spec.instance_variable_get(ivar)
        name  = ivar.to_s.split("@").last
        next if skip_fields.include?(name) || value.nil? || value == "" || (value.respond_to?(:empty?) && value.empty?)
        if name == "dependencies"
          value.each do |d|
            dep, *ver = d.to_s.split(" ")
            result <<  "  s.add_dependency #{dep.inspect}, #{ver.join(" ").inspect.gsub(/[()]/, "")}\n"
          end
        else
          case value
          when Array
            value =  name != "files" ? value.inspect : value.sort.uniq.inspect.split(",").join(",\n")
          when String, Fixnum, true, false
            value = value.inspect
          else
            value = value.to_s.inspect
          end
          result << "  s.#{name} = #{value}\n"
        end
      end
      result << "end"
      File.open(File.join(File.dirname(__FILE__), "#{spec.name}.gemspec"), "w"){|f| f << result}
    end

  end # namespace :gem

  # also keep the gemspec up to date each time we package a tarball or gem
  task :package => ['gem:update_gemspec']
  task :gem => ['gem:update_gemspec']

rescue LoadError
  puts <<EOF
###
  Packaging Warning : RubyGems is apparently not installed on this
  system and any file add/remove/rename will not
  be auto-updated in the 'iron-term-ansicolor.gemspec' when you run any
  package tasks.  All such file changes are recommended
  to be packaged on a system with RubyGems installed
  if you intend to push commits to the Git repo so the
  gemspec will also stay in sync for others.
###
EOF
end

# we are apparently on a system that does not have RubyGems installed.
# Lets try to provide only the basic tarball package tasks as a fallback.
unless defined? Gem
  begin
    require 'rake/packagetask'
    Rake::PackageTask.new(PKG_NAME, PKG_VERSION) do |p|
      p.package_files = PKG_FILES
      p.need_tar = true
      p.need_zip = true
    end
  rescue LoadError
    puts <<EOF
###
  Warning : Unable to require the 'rake/packagetask'. Is Rake installed?
###
EOF
  end
end

