class CreateJoinTableForClaimsAndTags < ActiveRecord::Migration
  def self.up
    create_table :claims_tags, :id => false do |t|
      t.references :claim
      t.references :tag
    end
  end

  def self.down
    drop_table :claims_tags
  end
end
