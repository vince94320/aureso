class OrganizationKind
  KINDS = ['Show room', 'Service', 'Dealer']

  attr_reader :kind

  def initialize(kind:)
    @kind = kind
  end

  def self.available_kinds
    KINDS
  end

  def self.random
    available_kinds.sample
  end

  def valid?
    KINDS.include? kind
  end

  def invalid?
    !valid?
  end
end
