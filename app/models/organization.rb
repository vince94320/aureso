class Organization < ActiveRecord::Base
  has_many :models

  validates_presence_of :name, :public_name
  validate :validate_organization_kind
  validate :validate_pricing_policy

  def pricing_policy
    PricingPolicy.build(attributes['pricing_policy'])
  end

  private
  def validate_pricing_policy
    begin
      pricing_policy
    rescue
      errors.add(:pricing_policy, 'is not a valid policy')
    end
  end

  def validate_organization_kind
    unless OrganizationKind.is_valid? kind
      errors.add(:kind, 'is not a valid organization type')
    end
  end
end
