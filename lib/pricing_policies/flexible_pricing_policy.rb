class FlexiblePricingPolicy
  include PricingPolicy

  def margin
    find_nodes('a').size.to_f / 100
  end

  def total_price
    base_price * Price.new(margin)
  end

  protected
  def find_nodes(string)
    agent.get('http://reuters.com')
         .search("//*[contains(text(), '#{string}')]")
  end
end
