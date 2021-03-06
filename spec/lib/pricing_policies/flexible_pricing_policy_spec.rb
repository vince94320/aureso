require 'spec_helper'

describe FlexiblePricingPolicy, vcr: true do
  let(:sut) { described_class.new }

  it 'calculates the total price by multiplying the base price and the margin' do
    base_price  = Price.new(100000)
    total_price = sut.total_price(base_price)

    expect(total_price).to eq Price.new(240000)
  end
end