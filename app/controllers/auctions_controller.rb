class AuctionsController < ApplicationController

  def index
    @title = "All Auctions"
    @auctions = Auction.all
  end
  
  def new
    @auction = Auction.new
    @title = "New auction"
  end
  
  def show
    @title = "View auction"
    @auction = Auction.find(params[:id])
  end
   
  def create
    @auction = Auction.create(params[:auction])
    render :show 
  end
end
