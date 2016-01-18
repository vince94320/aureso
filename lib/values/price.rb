class Price
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ==(other)
    other.value == value
  end

  def *(other)
    total = (value * other.value).ceil
    Price.new(total)
  end

  def +(other)
    Price.new(other.value + value)
  end
end
