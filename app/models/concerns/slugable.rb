require 'active_support/concern'

module Slugable
  extend ActiveSupport::Concern

  included do
    before_save :set_slug
  end

  protected
  def set_slug
    self.send("#{slug_attribute}=", slugify([organization_name, name]))
  end

  def slug_attribute
    attributes.each do |attribute, value|
      return attribute if attribute.match /slug/
    end
  end

  def slugify(items)
    slugifier = Slugifier.new
    items.map{|i| slugifier.slugify(i) }.join('-')
  end
end