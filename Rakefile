require 'rubygems'
require 'bundler'
Bundler::setup
require 'rake'
require 'jeweler'

require File.expand_path("../lib/ecell/phonyem/version", __FILE__)

Jeweler::Tasks.new do |gem|
  gem.name = "ecell-phonyem"
  gem.version = ECell::Phonyem::VERSION::STRING
  gem.author = "Moriyoshi Koizumi"
  gem.license = "MIT"
  gem.email = "mozo@mozo.jp"
  gem.homepage = "http://github.com/moriyoshi/ecell-phonyem"
  gem.platform = Gem::Platform::RUBY
  gem.summary = "The phony em parser"
  gem.files = ["LICENSE", "README.md", "Rakefile", "ecell-phonyem.gemspec", "{lib,examples}/**/*"].map{|p| Dir[p]}.flatten
  gem.require_path = "lib"
  gem.autorequire = "ecell"
  gem.has_rdoc = false
end
Jeweler::RubygemsDotOrgTasks.new

task :default => :treetop

task :treetop => 'lib/ecell/phonyem/expr/parser.treetop'
file 'lib/ecell/phonyem/expr/parser.treetop' do |t|
  TreeTop::Compiler::GrammarCompiler.new.compile(File.expand_path('../ecell/phonyem/expr/parser.rb', __FILE__))
end
