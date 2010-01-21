class CreateJoinTableForRoundsAndTags < ActiveRecord::Migration
  def self.up
    create_table :rounds_tags, :id => false do |t|
      t.references :round
      t.references :tag
    end
  end

  def self.down
    drop_table :rounds_tags
  end
end
