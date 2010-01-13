class RenameSquareOrderToPosition < ActiveRecord::Migration
  def self.up
    rename_column :squares, :order, :position
  end

  def self.down
    rename_column :squares, :position, :order
  end
end
