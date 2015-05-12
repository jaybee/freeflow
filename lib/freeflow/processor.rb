module Freeflow
  class Processor
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def compile(context)
      extensions.reverse.each { |ext| apply_filter ext, context }
    end

    def route
      if extension == "html"
        "#{item.identifier.chop}/index.html"
      else
        "#{item.identifier.chop}.#{extension}"
      end
    end

    private

    def apply_filter(ext, context)
      return unless (filter = Configuration.registered_filters[ext])
      filter.call(context)
    end

    def extensions
      @extensions ||= item[:extension].split(".").map(&:to_sym)
    end

    def extension
      @extension ||= (extensions - Configuration.registered_extensions).join(".")
    end
  end
end
