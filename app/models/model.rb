class Model < ActiveRecord::Base
  include Slugable

  belongs_to :organization
  has_many :model_types

  validates_presence_of :organization
end
