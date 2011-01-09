class AddPhotoToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :photo_file_name, :string #original filename
    add_column :auctions, :photo_content_type, :string #mime type
    add_column :auctions, :photo_file_size, :integer #file size
  end

  def self.down
    remove_column :auctions, :photo_file_name
    remove_column :auctions, :photo_content_type
    remove_column :auctions, :photo_file_size
  end
end
