class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions do |t|
      t.string :title
      t.string :description
      t.decimal :startbid
      t.decimal :currentbid

      t.timestamps
    end
  end

  def self.down
    drop_table :auctions
  end
end
