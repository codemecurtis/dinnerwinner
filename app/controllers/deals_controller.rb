class DealsController < ApplicationController

  def index

  end

  def show
    @deals = Business.find(params[:business_id]).deals.order(:created_at).reverse()
    render :json => @deals
  end

  def create
    @business = Business.find(params[:business_id])
    @business.deals << Deal.create(name: params[:title], short_description: params[:content], deal_image: params[:image])
    render :json => @business.deals
  end

  def update
    @deal = Deal.find(params[:id])
    p "#{@deal.name} --------------------"
    @deal.update_attributes(name: params[:title], short_description: params[:edit_content], deal_image: params[:image])
    render :json => @deal
  end

  def destroy
    @deal = Deal.find(params[:id])
    id = @deal.id
    @deal.destroy
    render :json => id
  end
end
