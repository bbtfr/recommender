$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "recommender/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "recommender"
  s.version     = Recommender::VERSION
  s.authors     = ["LiYang"]
  s.email       = ["bbtfrr@gmail.com"]
  s.homepage    = "https://github.com/bbtfr/recommender"
  s.summary     = "Product Recommender"
  s.description = "A product recommend plugin for ruby on rails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "jbuilder"

  s.add_development_dependency "sqlite3"
end
