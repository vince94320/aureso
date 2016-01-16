class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name,           null: false
      t.string :public_name,    null: false
      t.string :type,           null: false
      t.string :pricing_policy, null: false
    end
  end
end
