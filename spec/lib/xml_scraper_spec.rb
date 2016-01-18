require 'spec_helper'

class Price
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ==(other)
    other.value == value
  end

  def *(other)
    total = (value * other.value).ceil
    Price.new(total)
  end

  def +(other)
    Price.new(other.value + value)
  end
end

require 'mechanize'

class PricingPolicy
  def initialize(base_price:)
    @base_price = base_price
    @agent      = Mechanize.new {|agent| agent.user_agent_alias = 'Mac Safari'}
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


class FlexiblePricingPolicy < PricingPolicy
  def margin
    find_nodes('a').size.to_f / 100
  end

  def total_price
    base_price * Price.new(margin)
  end

  protected
  def find_nodes(string)
    agent.get('http://reuters.com')
         .search("//*[contains(text(), '#{string}')]")
  end
end

class FixedPricingPolicy < PricingPolicy
  def margin
    find_nodes('status').size
  end

  def total_price
    base_price + Price.new(margin)
  end

  protected
  def find_nodes(string)
    agent.get('https://developer.github.com/v3/#http-redirects')
         .search("//*[contains(text(), '#{string}')]")
  end
end

describe FlexiblePricingPolicy, vcr: true do
  let(:base_price) { Price.new(100000) }
  let(:sut)        { described_class.new(base_price: base_price) }

  it 'calculates the total price by multiplying the base price and the margin' do
    expect(sut.total_price).to eq Price.new(240000)
  end
end

describe FixedPricingPolicy, vcr: true do
  let(:base_price) { Price.new(100000) }
  let(:sut)        { described_class.new(base_price: base_price) }

  it 'calculates the total price by add the base price to the margin' do
    expect(sut.total_price).to eq Price.new(100005)
  end
end
