# Unidom Requirement 需求领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-requirement/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-requirement.svg)](https://badge.fury.io/rb/unidom-requirement)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-requirement.svg)](https://gemnasium.com/github.com/topbitdu/unidom-requirement)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Requirement domain model engine includes the Requirement and the Order Requirement Commitment model.
Unidom (统一领域对象模型)是一系列的领域模型引擎。需求领域模型引擎包括需求和订单需求委托的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-requirement'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200211.



## Call the Model

```ruby
requirement = Unidom::Requirement::Requirement.create! superior_requirement: nil, requirer: person, facility: room, reason: reason, estimated_budget: 100, quantity: 10, required_on: Date.current
# The #facility attribute could be nil.
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Requirement
  }

end
```



## RSpec examples

```ruby
# spec/models/unidom_spec.rb
require 'unidom/requirement/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/requirement/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/requirement/validators_rspec'
```
