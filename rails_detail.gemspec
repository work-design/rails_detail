$:.push File.expand_path('lib', __dir__)
require 'rails_detail/version'

Gem::Specification.new do |s|
  s.name = 'rails_detail'
  s.version = RailsDetail::VERSION
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_detail'
  s.summary = 'Detail of entity'
  s.description = 'Description of RailsDetail.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir[
    'test/**/*'
  ]

  s.add_dependency 'rails_com', '~> 1.2'
end
