# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "refinerycms-codemirror"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Agan"]
  s.date = "2012-08-01"
  s.description = "Replaces the textarea in WYMeditor with CodeMirror"
  s.email = "johnagan@gmail.com"
  s.homepage = "http://www.johnagan.com"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "refinerycms-codemirror"
  s.rubygems_version = "2.0.3"
  s.summary = "CodeMirror for Refinery"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<refinerycms-core>, [">= 0"])
    else
      s.add_dependency(%q<refinerycms-core>, [">= 0"])
    end
  else
    s.add_dependency(%q<refinerycms-core>, [">= 0"])
  end
end
