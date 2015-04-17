class DealsController < ApplicationController
  def index
    @deals = Business.find(params[:business_id]).deals
  end

  def create

  end

  def edit

  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to business_deals_path, :business_id => params[:business_id]
    # redirect '/businesses/params[:business_id]/deals'
  end
end
