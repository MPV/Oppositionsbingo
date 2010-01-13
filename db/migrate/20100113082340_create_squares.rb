class CreateSquares < ActiveRecord::Migration
  def self.up
    create_table :squares do |t|
      t.integer :card_id
      t.integer :claim_id

      t.timestamps
    end
  end

  def self.down
    drop_table :squares
  end
end
