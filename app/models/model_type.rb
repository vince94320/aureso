class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model, :name, :model_type_code
  validate :validate_base_price
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

  private
  def validate_base_price
    if attributes['base_price'].blank?
      errors.add(:base_price, "can't be blank")
    end
  end
end
