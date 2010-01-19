class AddPointsToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :points, :integer
  end

  def self.down
    remove_column :cards, :points
  end
end
