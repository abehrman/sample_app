class Auction < ActiveRecord::Base
      
  belongs_to :user

  attr_accessible :title, 
                  :description, 
                  :current_offer,
                  :current_offerer,
                  :current_bid,
                  :current_bidder,
                  :photo,
                  :end_time
                  
  validates :title, :presence  => true,
                    :length    => { :maximum => 75 }
  validates :description,       :presence => true
  validates :end_time,          :presence => true  
  

  has_attached_file :photo,
    :styles => { 
      :small => {:geometry => "100x100>", :polaroid => true},
      :medium => {:geometry => "250x250", :polaroid => false},
      :large => {:geometry => "500x500>", :polaroid => false}},
      :processors => [:thumbnail, :polaroid]


end
