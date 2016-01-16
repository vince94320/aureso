class ModelType < ActiveRecord::Base
  include Slugable

  belongs_to :model
  validates_presence_of :model
end
