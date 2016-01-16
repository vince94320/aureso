class ChangeBasePriceTypeToFloatOnModelTypes < ActiveRecord::Migration
  def up
    change_table :model_types do |t|
      t.change :base_price, :float, null: false
    end
  end

  def down
    change_table :model_types do |t|
      t.change :base_price, :string, null: false
    end
  end
end
