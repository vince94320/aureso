class ChangeBasePriceTypeToIntegerOnModelTypes < ActiveRecord::Migration
  def up
    change_table :model_types do |t|
      t.change :base_price, :integer, null: false
    end
  end

  def down
    change_table :model_types do |t|
      t.change :base_price, :float, null: false
    end
  end
end
