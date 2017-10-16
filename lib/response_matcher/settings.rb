module ResponseMatcher
  class Settings
    extend ::Dry::Configurable

    setting :helpers, []
    setting :directory, 'spec/schemas'
  end
end
