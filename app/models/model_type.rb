class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model

  def self.find_by_slug(slug)
    find_by(model_type_slug: slug)
  end

  def total_price
    (base_price + 10000.to_f).to_i
  end
end
