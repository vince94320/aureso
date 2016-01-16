class PricingPolicy
  POLICIES = ['Flexible', 'Fixed', 'Prestige']

  attr_reader :policy

  def initialize(policy:)
    @policy = policy
  end

  def self.available_policies
    POLICIES
  end

  def self.random
    available_policies.sample
  end

  def valid?
    POLICIES.include? policy
  end

  def invalid?
    !valid?
  end
end
