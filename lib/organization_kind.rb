class OrganizationKind
  KINDS = ['Show room', 'Service', 'Dealer']

  def self.is_valid?(kind)
    KINDS.include? kind
  end

  def self.random
    KINDS.sample
  end
end
