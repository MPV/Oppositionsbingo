class CreateClaims < ActiveRecord::Migration
  def self.up
    create_table :claims do |t|
      t.String :title

      t.timestamps
    end
  end

  def self.down
    drop_table :claims
  end
end
