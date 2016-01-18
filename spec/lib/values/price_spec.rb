require 'spec_helper'

describe Price do
  it 'multiplies the price rounding up' do
    expect(Price.new(5)*2).to eq Price.new(10)
    expect(Price.new(5)*0).to eq Price.new(0)
    expect(Price.new(5)*2.5).to eq Price.new(13)
  end
end