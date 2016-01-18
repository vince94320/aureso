describe PricingPolicy do
  it 'provides a random policy' do
    random_policy = described_class.random

    expect(described_class.available_policies).to include random_policy
  end
end
