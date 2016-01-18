module Serializer
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def serialize(*args)
      new(*args).serialize
    end
  end

  def initialize(object, root: nil)
    @object = object
    @root   = root
  end

  def serialize
    builded = collection ? collection.map{|o| build(o)} : build(single)
    builded = root ? { root => builded } : builded
    builded.to_json
  end

  def build(single)
    raise "#{self.class}#build not implemented"
  end

  protected
  attr_reader :object, :root

  def single
    object unless object.respond_to? :each
  end

  def collection
    object if object.respond_to? :each
  end
end
