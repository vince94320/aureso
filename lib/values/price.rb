class Price
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ==(other)
    other.value == value
  end

  def *(multiplicator)
    new_value = (value * multiplicator).ceil
    Price.new(new_value)
  end

  def +(other)
    Price.new(other.value + value)
  end

  def to_s
    value
  end
end
