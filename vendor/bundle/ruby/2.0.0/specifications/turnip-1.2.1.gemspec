# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "turnip"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonas Nicklas"]
  s.date = "2014-02-12"
  s.description = "Provides the ability to define steps and run Gherkin files from with RSpec"
  s.email = ["jonas.nicklas@gmail.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "turnip"
  s.rubygems_version = "2.0.3"
  s.summary = "Gherkin extension for RSpec"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, ["< 4.0", ">= 2.0"])
      s.add_runtime_dependency(%q<gherkin>, [">= 2.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["< 4.0", ">= 2.0"])
      s.add_dependency(%q<gherkin>, [">= 2.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["< 4.0", ">= 2.0"])
    s.add_dependency(%q<gherkin>, [">= 2.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
