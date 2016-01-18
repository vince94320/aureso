require 'spec_helper'

describe FixedPricingPolicy, vcr: true do
  let(:sut) { described_class.new }

  it 'calculates the total price by add the base price to the margin' do
    base_price  = Price.new(120500)
    total_price = sut.total_price(base_price)

    expect(total_price).to eq Price.new(120505)
  end
end
