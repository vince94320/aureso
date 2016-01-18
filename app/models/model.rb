class Model < ActiveRecord::Base
  include Slugable

  belongs_to :organization
  has_many :model_types

  validates_presence_of :organization

  delegate :name, to: :organization, prefix: true, allow_nil: true
  delegate :pricing_policy, to: :organization, prefix: true, allow_nil: true
end
