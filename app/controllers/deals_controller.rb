class DealsController < ApplicationController

  def index

  end

  def show
    @deals = Business.find(params[:business_id]).deals
    render :json => @deals
  end

  def create

  end

  def edit
    @deal = Deal.find(params[:id])
    @deal.update_attributes()
    # render :json => id
  end

  def destroy
    @deal = Deal.find(params[:id])
    id = @deal.id
    @deal.destroy
    render :json => id
  end
end
