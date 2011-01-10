class AddTitleDescToAuctions < ActiveRecord::Migration
  def self.up
    add_column :auctions, :title, :string
    add_column :auctions, :description, :text
  end

  def self.down
  end
end
