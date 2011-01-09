class Auction < ActiveRecord::Base
  has_attached_file :photo,
    :styles => {
      :small => "250x250>" }
end
