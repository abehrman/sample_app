class AuctionsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def index
    @title = "All Auctions"
    @auction = Auction.all
    counter = 0
    @auction.each do |id|
      @auction_ids[counter] = id.id
      counter = counter + 1
    end
  end
  
  def new
    @title = "New Auction"
    @auction = Auction.new
  end
   
  def show
    @title = "View auction"
    @auction = Auction.find(params[:id])
    @end_time = @auction.end_time
    
  end
  

  def create
  
  @auction = current_user.auctions.build(params[:auction])
  @user = current_user
  @auction.current_offerer = @user.id
  @auction.subsidy = 0.50
  @auction.fees = 0.10
    if @auction.save
      flash[:success] = "Auction created!"
      redirect_to @auction
    else
      @title = "New Auction"
      render 'new'
    end
  end
  
  def destroy
    Auction.find(params[:id]).destroy
    flash[:success] = "Auction destroyed."
    redirect_to auctions_path
  end
  
  def update
    @auction = Auction.find(params[:id])
#    @auction.current_bid = params[:current_bid]
#    @auction.current_bid = params[:current_bidder]
    @auction.current_bid = 100.00
    @auction.current_bid = 1
    
    if @auction.save
      flash[:succes] = "New bid entered!"
      render auction_path, :method => 'get'
    else
      flash[:error] = "Unable to save new bid"
      render auction_path, :method => 'get'
    end
  end
  
  private
  def authorized_user
    @auction = Auction.find(params[:id])
    redirect_to root_path unless current_user?(@auction.user)
  end
  
end
