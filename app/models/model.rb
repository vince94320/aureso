class Model < ActiveRecord::Base
  before_save :set_model_slug

  private
  def set_model_slug
    self.model_slug = slugify(name)
  end

  def slugify(string)
    Slugifier.new.slugify(string)
  end
end
