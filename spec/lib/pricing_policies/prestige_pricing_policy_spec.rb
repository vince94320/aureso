require 'spec_helper'

describe PrestigePricingPolicy, vcr: true do
  let(:sut) { described_class.new }

  it 'calculates the total price by add the base price to the margin' do
    base_price  = Price.new(140000)
    total_price = sut.total_price(base_price)

    expect(total_price).to eq Price.new(140051)
  end
end
