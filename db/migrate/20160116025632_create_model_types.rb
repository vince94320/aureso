class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.references :model,           null: false, index: true
      t.string     :name,            null: false
      t.string     :model_type_slug, null: false
      t.string     :model_type_code, null: false
      t.string     :base_price,      null: false
    end

    add_index :model_types, :model_type_slug, unique: true
  end
end
