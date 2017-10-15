module ResponseMatcher
  class ParseSchema
    def self.new(schema_path, object_hash = {})
      config = Settings.config

      config.helpers.each do |helper|
        include helper
      end

      attr_accessor(*object_hash.keys, :schema_path, :response, :object_hash)

      super(schema_path, object_hash)
    end

    def initialize(schema_path, object_hash)
      @schema_path = schema_path
      @object_hash = object_hash

      object_hash.each do |name, value|
        instance_variable_set "@#{name}", value
      end

      @response = eval(File.read(File.absolute_path("spec/schemas/#{schema_path}.rb")))
    end
  end
end
