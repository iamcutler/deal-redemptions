$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deal_redemptions/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deal_redemptions"
  s.version     = DealRedemptions::VERSION
  s.authors     = ["Allan Cutler"]
  s.email       = ["iamcutler@icloud.com"]
  s.homepage    = "http://github.com/iamcutler"
  s.summary     = "Ruby on Rails Engine to redeem deal site promotions."
  s.description = "Ruby on Rails Engine to redeem deal site promotions."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "sass-rails", "~> 4.0.3"
  s.add_dependency "haml-rails"
end
