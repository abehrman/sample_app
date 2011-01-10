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
  @auction = current_user.auctions.build(params[:auction])
  @user = current_user
  @auction.current_offerer
  @auction.subsidy = 0.50
  @auction.fees = 0.10
    if @auction.save
      flash[:success] = "Auction created!"
      redirect_to auction_path 
    end
  end
  
end
