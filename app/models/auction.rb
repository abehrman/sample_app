class Auction < ActiveRecord::Base
      
  belongs_to :user

  attr_accessible :title, 
                  :description, 
                  :current_offer,
                  :current_offerer,
                  :current_bid,
                  :current_bidder

  has_attached_file :photo,
    :styles => {
      :small => "250x250>" }
  
  
  
end
