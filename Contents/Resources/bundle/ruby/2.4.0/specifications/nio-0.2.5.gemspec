# -*- encoding: utf-8 -*-
# stub: nio 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "nio".freeze
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Javier Goizueta".freeze]
  s.date = "2010-05-31"
  s.description = "Numeric input/output".freeze
  s.email = "javier@goizueta.info".freeze
  s.extra_rdoc_files = ["History.txt".freeze, "License.txt".freeze, "README.txt".freeze, "SOURCE.txt".freeze]
  s.files = ["History.txt".freeze, "License.txt".freeze, "README.txt".freeze, "SOURCE.txt".freeze]
  s.homepage = "http://nio.rubyforge.org".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze, "--title".freeze, "Nio Documentation".freeze, "--opname".freeze, "index.html".freeze, "--line-numbers".freeze, "--inline-source".freeze, "--main".freeze, "README.txt".freeze]
  s.rubyforge_project = "nio".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Numeric input/output".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<flt>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<bones>.freeze, [">= 2.1.1"])
    else
      s.add_dependency(%q<flt>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<bones>.freeze, [">= 2.1.1"])
    end
  else
    s.add_dependency(%q<flt>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<bones>.freeze, [">= 2.1.1"])
  end
end
