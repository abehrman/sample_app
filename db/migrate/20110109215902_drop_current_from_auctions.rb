class DropCurrentFromAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions do |t|
    t.column :created_by_id, :integer
    t.column :subsidy, :decimal
    t.column :fees, :decimal
    t.column :end_time, :datetime
    t.column :current_offer, :decimal
    t.column :current_offerer, :decimal    
    t.column :current_bid, :decimal
    t.column :current_bidder, :decimal
    t.column :photo_file_name, :string #original filename
    t.column :photo_content_type, :string #mime type
    t.column :photo_file_size, :integer #file size
    t.timestamps
  end
  end

  def self.down
    drop_table auctions
  end
end
