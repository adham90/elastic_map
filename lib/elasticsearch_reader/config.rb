module ElasticsearchReader
  class Config
    include Singleton

    def configuration
      yaml_settings.merge(settings.deep_symbolize_keys).tap do |configuration|
        configuration[:logger] ||= transport_logger
        configuration.merge!(tracer: transport_tracer) if transport_tracer
      end
    end

    private

    def yaml_settings
      @yaml_settings ||= begin
        file = Rails.root.join('config', 'elasticsearch_reader.yml')
        yaml = ERB.new(File.read(file)).result
        symbolize_keys(YAML.safe_load(yaml))
      end || {}
    end

    def symbolize_keys(hash)
      hash.each_with_object({}) do |(k, v), h|
        h[k.to_sym] = v.is_a?(Hash) ? symbolize_keys(v) : v
      end
    end
  end
end
