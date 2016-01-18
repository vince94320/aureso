require 'mechanize'

module PricingPolicy
  POLICIES = ['Flexible', 'Fixed', 'Prestige']

  def initialize(base_price:)
    @base_price = base_price
    @agent      = Mechanize.new {|agent| agent.user_agent_alias = 'Mac Safari'}
  end

  def self.available_policies
    POLICIES
  end

  def self.random
    available_policies.sample
  end

  def margin
    0
  end

  def total_price
    0
  end

  def self.available_policies
    POLICIES
  end

  def self.random
    available_policies.sample
  end

  def self.valid_policy? policy_name
    POLICIES.include? policy_name
  end

  # def invalid?
  #   !valid?
  # end

  protected
  attr_reader :agent, :base_price

  def find_nodes(string)
    []
  end
end
