module Freeflow
  class Configuration

    class << self
      def registered_filters
        @@registered_filters ||= {}
      end

      def registered_extensions
        registered_filters.keys
      end

      def context
        @@context
      end
    end

    def sass_paths(*paths)
      SassPaths.append *paths
    end

    def filter(*args)
      options = args.pop
      filter_name = options.delete(:with)
      exts = args
      exts.each { |ext| self.class.registered_filters[ext.to_sym] = filter_for(filter_name, options) }
    end

    def context(c)
      @@context = c
    end

    private

    def filter_for(filter_name, options)
      -> { filter filter_name, options }
    end
  end
end
