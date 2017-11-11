module ResponseMatcher
  class ParseSchema
    def self.new(schema_path, objects = {})
      Settings.config.helpers.each { |helper| include helper }
      attr_accessor(*objects.keys)

      super(schema_path, objects)
    end

    attr_reader :schema_path, :objects, :response

    def initialize(schema_path, objects)
      @schema_path = schema_path
      @objects = objects

      initialize_objects
      render_schema
    end

    def call(schema_path, objects = {})
      self.class.new(schema_path, objects).response
    end

    private

    def initialize_objects
      objects.each do |name, value|
        instance_variable_set "@#{name}", value
      end
    end

    def render_schema
      path = File.absolute_path("#{Settings.config.directory}/#{schema_path}.rb")
      @response = eval(File.read(path))
    end
  end
end
