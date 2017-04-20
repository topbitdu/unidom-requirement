$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/requirement/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-requirement'
  spec.version     = Unidom::Requirement::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-requirement'
  spec.summary     = 'Unidom Requirement Domain Model Engine 需求领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Requirement domain model engine includes the Requirement and the Order Requirement Commitment model. Unidom (统一领域对象模型)是一系列的领域模型引擎。需求领域模型引擎包括需求和订单需求委托的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '~> 1.10'

end
