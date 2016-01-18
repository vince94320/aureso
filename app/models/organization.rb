class Organization < ActiveRecord::Base
  validate :valid_organization_type
  validate :valid_pricing_policy

  private
  def valid_pricing_policy
    unless PricingPolicy.valid_policy? pricing_policy
      errors.add(:pricing_policy, 'is not a valid policy')
    end
  end

  def valid_organization_type
    organization_type = OrganizationType.new(type: type)

    if organization_type.invalid?
      errors.add(:type, 'is not a valid organization type')
    end
  end
end
