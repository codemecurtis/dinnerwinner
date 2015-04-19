class BusinessesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create_mass_deal
  include BusinessesHelper

  def index
  end

  def show
    viewed_business
    business_deals = Deal.where(business_id: params[:id])
    @mass_deal = []
    business_deals.each do |deal|
      CustomerDeal.where(deal_id: deal.id).each do |deals|
        if deals.mass_deal
          @mass_deal << deals
        end
      end
    end

    @array_of_requests=[]
    CustomerDeal.all.each do |deal|
      temp = Deal.find(deal.deal_id)
      if Business.find(params[:id]).neighborhood == deal.neighborhood
    # if params[:id]==temp.business_id
    @array_of_requests << deal
  end
end


@accepted_deals = []
business_deals.each do |deal|
  CustomerDeal.where(deal_id: deal.id).each do |deals|
    if deals.accepted
      @accepted_deals << deals
    end
  end
end
authenticate_business
end

def edit
  viewed_business
end

def create_mass_deal
  CustomerDeal.create(deal_id:params[:deal], party_size: params[:party_size], mass_deal: true)
  redirect_to action: 'show', id: current_business.id
end

def mass_deal
  @deals = Deal.where(business_id: params[:business_id])
end

end
