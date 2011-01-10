class AddColsToAuctions < ActiveRecord::Migration
  def self.up
    add_column :auctions, :created_by_id, :integer
    add_column :auctions, :subsidy, :decimal
    add_column :auctions, :fees, :decimal
    add_column :auctions, :end_time, :datetime
    add_column :auctions, :current_offer, :decimal
    add_column :auctions, :current_bid, :decimal
    remove_column :auctions, :AuctionEnd
    remove_column :auctions, :startbid
    remove_column :auctions, :currentbid
    
  end

  def self.down
    remove_column :auctions, :fees
    remove_column :auctions, :subsidy
    remove_column :auctions, :created_by_id
    remove_column :auctions, :end_time
    remove_column :auctions, :current_offer
    remove_column :auctions, :current_bid
    
  end
end
