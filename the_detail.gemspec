$:.push File.expand_path('../lib', __FILE__)

require 'the_detail/version'

Gem::Specification.new do |s|
  s.name        = 'the_detail'
  s.version     = TheDetail::VERSION
  s.authors     = ["qinmingyuan"]
  s.email       = ["mingyuan0715@foxmail.com"]
  s.homepage    = "https://github.com/yigexiangfa/the_detail"
  s.summary     = "Summary of TheDetail."
  s.description = "Description of TheDetail."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '>= 5.0'
  s.add_dependency 'acts_as_list'
end
