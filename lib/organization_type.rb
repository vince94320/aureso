class OrganizationType
  TYPES = ['Show room', 'Service', 'Dealer']

  attr_reader :type

  def initialize(type:)
    @type = type
  end

  def self.available_types
    TYPES
  end

  def self.random
    available_types.sample
  end

  def valid?
    TYPES.include? type
  end

  def invalid?
    !valid?
  end
end
