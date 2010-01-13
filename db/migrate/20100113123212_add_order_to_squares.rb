class AddOrderToSquares < ActiveRecord::Migration
  def self.up
    add_column :squares, :order, :integer
  end

  def self.down
    remove_column :squares, :order
  end
end
