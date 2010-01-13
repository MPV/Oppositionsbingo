class AddUsedToSquares < ActiveRecord::Migration
  def self.up
    add_column :squares, :used, :boolean
  end

  def self.down
    remove_column :squares, :used
  end
end
