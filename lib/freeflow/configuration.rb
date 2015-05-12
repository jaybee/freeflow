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
      filter_name = options.delete(:with)
      exts = args.map(&:to_sym)
      ftr = filter_for(filter_name, options)
      exts.each { |ext| self.class.registered_filters[ext] = ftr }
    end

    private

    def filter_for(filter_name, options)
      ->(c) { c.filter filter_name, options }
    end
  end
end
