class Model < ActiveRecord::Base
  include Slugable

  has_many :model_types
end
