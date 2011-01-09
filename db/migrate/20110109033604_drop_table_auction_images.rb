class DropTableAuctionImages < ActiveRecord::Migration
  def self.up
    drop_table :auction_images
  end

  def self.down
  end
end
