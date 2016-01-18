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

  def total_price
    pricing_policy = PricingPolicy.build(organization_pricing_policy)
    base_price + 10000
  end
end
