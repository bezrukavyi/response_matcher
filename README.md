# ResponseMatcher

Simple solution to check json response in your request tests as [Rspec](https://github.com/rspec/rspec) matcher

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'response_matcher', '~> 0.1.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install response_matcher

## Usage

### Quick start

In ```registration_spec.rb```
```ruby
describe RegistrationsController do
  describe 'POST /auth' do
    it 'response' do
      post user_registration_path, params: params

      expect(response).to response_match('schema_path', user: User.last)
    end
  end
end
```

### You can create your own schema

```
└─ spec
    ├─ schemas
    │   ├─ my_schema.rb
    │   └─ ...
    └─ ...
```

In ```my_schema.rb``` you can describe by ruby language how looks like your response

```ruby
# All the parameters that you transmit will be available as variables, like 'user'
{
  data: {
    id: user.id,
    type: user.class.name,
    attributes: {
      email: user.email,
      provider: user.provider,
      uid: user.uid
    }
  }
}
```

### You can reuse your schemas in another schemas

```
└─ spec
    ├─ schemas
    │   ├─ my_schema.rb
    │   ├─ attributes.rb
    │   └─ ...
    └─ ...
```

In ```my_schema.rb```
```ruby
# All the parameters that you transmit will be available as variables, like 'user'
{
  data: {
    id: user.id,
    type: user.class.name,
    attributes: call('attributes', user: user)
  }
}
```

In ```attributes.rb```
```ruby
{
  email: user.email,
  provider: user.provider,
  uid: user.uid
}
```

### You can use helpers in your schemas:

```
└─ spec
    ├─ schemas
    │   ├─ my_schema.rb
    │   ├─ attributes.rb
    │   └─ ...
    ├─ helpers
    │   ├─ my_helper.rb
    │   └─ ...
    ├─ rails_helper.rb
    └─ ...
```

In ```my_helper.rb```
```ruby
module Helpers
  module MyHelper
    def entity_class(entity)
      entity.class.name
    end
  end
end
```

In ```rails_helper.rb```
```ruby
ResponseMatcher::Settings.configure do |config|
  config.helpers = [
    Helpers::MyHelper,
    ...
  ]
end
```

In ```my_schema.rb```
```ruby
{
  data: {
    id: user.id,
    type: entity_class(user),
    attributes: call('attributes', user: user)
  }
}
```

### You can set base directory of your schemas:

In ```rails_helper.rb```
```ruby
ResponseMatcher::Settings.configure do |config|
  config.helpers = [Helpers::MyHelper, ...]
  config.directory = 'spec/schemas/api/v1'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bezrukavyi/response_matcher

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
