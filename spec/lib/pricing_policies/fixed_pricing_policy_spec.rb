require 'spec_helper'

describe FixedPricingPolicy, vcr: true do
  let(:base_price) { Price.new(120500) }
  let(:sut)        { described_class.new(base_price: base_price) }

  it 'calculates the total price by add the base price to the margin' do
    expect(sut.total_price).to eq Price.new(120505)
  end
end
