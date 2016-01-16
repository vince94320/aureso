class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model

  def total_price
    (base_price + 10000.to_f).to_i
  end
end
