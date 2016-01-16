class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model

  def total_price
    45
  end
end
