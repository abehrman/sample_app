class AddAuctionEndToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :AuctionEnd, :datetime
  end

  def self.down
    remove_column :auctions, :AuctionEnd
  end
end
