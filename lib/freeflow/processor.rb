module Freeflow
  class Processor
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def compile
      extensions.each { |ext| apply_filter ext }
    end

    def route
      if extension == "html"
        "#{item.identifier.chop}/index.html"
      else
        "#{item.identifier.chop}.#{extension}"
      end
    end

    def apply_filter(ext)
      return unless (filter = Configuration.registered_filters[ext])
      Configuration.context.instance_exec { filter }
    end

    private

    def extensions
      @extensions ||= item[:extension].split(".").map(&:to_sym)
    end

    def extension
      @extension ||= (extensions - Configuration.registered_extensions).join(".")
    end
  end
end
