class AddRoundIdToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :round_id, :integer
  end

  def self.down
    remove_column :cards, :round_id
  end
end
