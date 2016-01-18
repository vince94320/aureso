class Organization < ActiveRecord::Base
  has_many :models

  validate :valid_organization_type
  validate :valid_pricing_policy

  private
  def valid_pricing_policy
    begin
      PricingPolicy.build(pricing_policy)
    rescue
      errors.add(:pricing_policy, 'is not a valid policy')
    end
  end

  def valid_organization_type
    organization_type = OrganizationKind.new(kind: kind)

    if organization_type.invalid?
      errors.add(:kind, 'is not a valid organization type')
    end
  end
end
