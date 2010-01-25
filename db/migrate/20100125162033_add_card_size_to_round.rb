class AddCardSizeToRound < ActiveRecord::Migration
  def self.up
    add_column :rounds, :card_size, :integer
  end

  def self.down
    remove_column :rounds, :card_size
  end
end
