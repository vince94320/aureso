class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name, null: false
      t.string :model_slug, null: false
    end

    add_index :models, :model_slug, unique: true
  end
end
