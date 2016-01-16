class AddOrganizationReferenceOnModels < ActiveRecord::Migration
  def change
    add_reference :models, :organization, index: true
  end
end
