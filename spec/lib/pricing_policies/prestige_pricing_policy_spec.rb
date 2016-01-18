require 'spec_helper'

describe PrestigePricingPolicy, vcr: true do
  let(:base_price) { Price.new(140000) }
  let(:sut)        { described_class.new(base_price: base_price) }

  it 'calculates the total price by add the base price to the margin' do
    expect(sut.total_price).to eq Price.new(140051)
  end
end
