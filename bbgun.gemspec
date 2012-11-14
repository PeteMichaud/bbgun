# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bbgun/version"

Gem::Specification.new do |s|
	s.name = "bbgun"
	s.version = BBGun::VERSION
	s.platform = Gem::Platform::RUBY
	s.authors = ["Pete Michaud"]
	s.email = ["michaudp@gmail.com"]
	s.homepage = "http://www.github.com/PeteMichaud/bbgun"
	s.summary = "Provides BBCode for Ruby."
  s.summary = "Provides BBCode for Ruby."

  s.add_development_dependency "rspec"
	s.add_dependency "coderay"
	
	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.require_paths = ["lib"]
end
