require 'rails_helper'

describe Model do
  it 'infers the model slug based on the name' do
    sut = described_class.create(name: 'Some Name')

    expect(sut.model_slug).to eq 'some-name'
  end
end