module Freeflow
  class Configuration

    class << self
      def registered_filters
        @@registered_filters ||= {}
      end

      def registered_extensions
        registered_filters.keys
      end
    end

    def filter(*args)
      options = args.pop
      name = options.delete(:with)
      extensions = args.map(&:to_sym)

      filter = ->(context) { context.filter(name, options) }
      extensions.each { |extension| self.class.registered_filters[extension] = filter }
    end
  end
end
