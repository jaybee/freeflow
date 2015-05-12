require "freeflow/version"
require "freeflow/configuration"
require "freeflow/processor"

module Freeflow
  def self.configure(&block)
    Configuration.new.tap do |registry|
      registry.instance_exec &block
    end
  end

  def self.compile(item, context)
    Processor.new(item).compile(context)
  end

  def self.route(item)
    Processor.new(item).route
  end
end
