class FixedPricingPolicy
  include PricingPolicy

  def margin
    find_nodes('status').size
  end

  def total_price
    base_price + Price.new(margin)
  end

  protected
  def find_nodes(string)
    agent.get('https://developer.github.com/v3/#http-redirects')
         .search("//*[contains(text(), '#{string}')]")
  end
end
