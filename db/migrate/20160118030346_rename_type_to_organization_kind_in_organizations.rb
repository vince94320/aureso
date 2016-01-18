class RenameTypeToOrganizationKindInOrganizations < ActiveRecord::Migration
  def up
    rename_column :organizations, :type, :kind
  end

  def down
    rename_column :organizations, :kind, :type
  end
end
