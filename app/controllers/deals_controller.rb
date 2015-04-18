class DealsController < ApplicationController

  def index
    @deals = Business.find(params[:business_id]).deals
    render :json => @deals
  end

  def create
  end

  def edit
  end

  def destroy
    @deal = Deal.find(params[:id])
    id = @deal.id
    @deal.destroy
    render :json => id
  end
end
