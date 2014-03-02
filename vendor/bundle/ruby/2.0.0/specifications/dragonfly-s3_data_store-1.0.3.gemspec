# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dragonfly-s3_data_store"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Evans"]
  s.date = "2014-01-07"
  s.description = "S3 data store for Dragonfly"
  s.email = ["mark@new-bamboo.co.uk"]
  s.homepage = "https://github.com/markevans/dragonfly-s3_data_store"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Data store for storing Dragonfly content (e.g. images) on S3"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dragonfly>, ["~> 1.0"])
      s.add_runtime_dependency(%q<fog>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<dragonfly>, ["~> 1.0"])
      s.add_dependency(%q<fog>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<dragonfly>, ["~> 1.0"])
    s.add_dependency(%q<fog>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end
