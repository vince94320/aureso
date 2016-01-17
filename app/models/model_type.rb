class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model
  delegate :organization_name, to: :model, allow_nil: true
  delegate :model_slug, to: :model, allow_nil: true

  def self.find_by_slug(slug)
    find_by(model_type_slug: slug)
  end

  def total_price
    (base_price + 10000.to_f).to_i
  end
end
