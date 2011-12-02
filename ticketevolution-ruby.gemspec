# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ticketevolution-ruby/version"

Gem::Specification.new do |s|
  s.name        = "ticketevolution-ruby"
  s.version     = Ticketevolution::Ruby::VERSION
  s.authors     = ["Derek Dahmer"]
  s.email       = ["derekdahmer@gmail.com"]
  s.homepage    = ""
  s.summary     = "TicketEvolution API gem"
  s.description = "TicketEvolution API gem"

  s.rubyforge_project = "ticketevolution-ruby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency "httparty"
end
