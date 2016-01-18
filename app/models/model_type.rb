class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model
  delegate :organization_name, to: :model, allow_nil: true
  delegate :model_slug, to: :model, allow_nil: true
  delegate :organization_pricing_policy, to: :model, allow_nil: true

  def self.find_by_slug(slug)
    find_by(model_type_slug: slug)
  end

  def base_price
    Price.new(attributes['base_price'])
  end

  def total_price
    organization_pricing_policy.total_price(base_price)
  end
end
