require 'spec_helper'

describe FlexiblePricingPolicy, vcr: true do
  let(:base_price) { Price.new(100000) }
  let(:sut)        { described_class.new(base_price: base_price) }

  it 'calculates the total price by multiplying the base price and the margin' do
    expect(sut.total_price).to eq Price.new(240000)
  end
end