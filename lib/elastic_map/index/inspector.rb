module ElasticMap
  class Index
    module Inspector
      def inspect
        string = "#<#{self.class.name}:#{object_id} "
        inspected = self.class.fields.map do |field|
          if field.type == String
            "#{field.name}: \"#{map_field(field)}\""
          else
            "#{field.name}: #{map_field(field)}"
          end
        end
        string << inspected.join(', ') << '>'
      end
    end
  end
end
