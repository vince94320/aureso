require 'mechanize'

module PricingPolicy
  POLICIES = ['Flexible', 'Fixed', 'Prestige']

  def initialize(base_price: 0)
    @base_price = base_price
    @agent      = Mechanize.new {|agent| agent.user_agent_alias = 'Mac Safari'}
  end

  def self.build(policy_name)
    "#{policy_name}PricingPolicy".constantize.new
  end

  def self.sample_name
    POLICIES.sample
  end

  def margin
    0
  end

  def total_price
    0
  end

  protected
  attr_reader :agent, :base_price

  def find_nodes(string)
    []
  end
end
