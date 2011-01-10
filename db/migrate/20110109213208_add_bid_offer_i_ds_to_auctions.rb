class AddBidOfferIDsToAuctions < ActiveRecord::Migration
  def self.up
    add_column :auctions, :current_bidder, :integer
    add_column :auctions, :current, :offerer
  end

  def self.down
    remove_column :auctions, :current
    remove_column :auctions, :current_bidder
  end
end
