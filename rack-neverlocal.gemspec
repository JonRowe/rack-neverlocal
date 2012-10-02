# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/neverlocal/version"

Gem::Specification.new do |s|
  s.name        = "rack-neverlocal"
  s.version     = Rack::NeverLocal::VERSION
  s.authors     = ["Jon Rowe"]
  s.email       = ["hello@jonrowe.co.uk"]
  s.homepage    = "https://github.com/jonrowe/rack-neverlocal"
  s.summary     = %q{What's this? A local request? Never!}
  s.description = %q{Basically this gems aim is to strip 127.0.0.1 from REMOTE_ADDR to make Rails think it's a remote request... always...}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

end
