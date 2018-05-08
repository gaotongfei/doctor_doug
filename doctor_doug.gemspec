$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "doctor_doug/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "doctor_doug"
  s.version     = DoctorDoug::VERSION
  s.authors     = ["Tongfei Gao"]
  s.email       = ["gaotongfei1995@gmail.com"]
  s.homepage    = "https://github.com/gaotongfei/doctor_doug"
  s.summary     = "DoctorDoug."
  s.description = "DoctorDoug."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
