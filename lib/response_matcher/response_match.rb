RSpec::Matchers.define :response_match do |schema_path, object_hash|
  match do |response|
    @parse_schema = ResponseMatcher::ParseSchema.new(schema_path, object_hash)
    @actual = JSON.parse(response.body)
    @expected = @parse_schema.response
    @actual == @expected
  end

  diffable
  attr_reader :actual, :expected
end
