describe OrganizationType do
  it 'provides a random type' do
    random_type = described_class.random

    expect(described_class.available_types).to include random_type
  end
end
