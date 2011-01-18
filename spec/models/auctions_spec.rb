require 'spec_helper'

describe Auction do
	before(:each) do
	  @attr = {
	    :title => "Junk",
	    :description => "Random Junk",
	    :end_time => "July 1, 2011"
	  }
	end
	
	it "should create a new instance if valid" do
		Auction.create!(@attr)
	end
end