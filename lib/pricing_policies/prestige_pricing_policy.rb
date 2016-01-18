class PrestigePricingPolicy
  include PricingPolicy

  def margin
    find_nodes('pubDate').size
  end

  def total_price(base_price)
    base_price + Price.new(margin)
  end

  protected
  def find_nodes(string)
    agent.get('http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
         .search("//#{string}")
  end
end
