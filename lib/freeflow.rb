require "freeflow/version"
require "freeflow/configuration"
require "freeflow/processor"

module Freeflow
  def self.configure(context, &block)
    Configuration.new.tap do |registry|
      registry.context(context)
      registry.instance_exec &block
    end
  end

  def self.compile(item)
    Processor.new(item).compile
  end

  def self.route(item)
    Processor.new(item).route
  end
end
