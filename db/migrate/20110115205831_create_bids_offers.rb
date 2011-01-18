class CreateBidsOffers < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.string :type
      t.decimal :amount
      t.integer :user_id
      t.integer :auction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
