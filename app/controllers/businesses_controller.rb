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

    @my_deals_templates = Deal.where(business_id:params[:id])

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

  def request_list
    @business = Business.find(params[:business_id])
    @requests=[]
    CustomerDeal.all.each do |deal|
      # temp = Deal.find(deal.deal_id)
      bneigh = JSON.parse(@business.neighborhoods).map { |e| e.downcase }
      dneigh = JSON.parse(deal.neighborhoods).map { |e| e.downcase }
      if (bneigh.any? {|e| dneigh.include?(e)}) && (deal.deal_id==nil)
        name_customer = Customer.find(deal.customer_id).first_name
        time_customer = deal.reservation_time
        size_customer = deal.party_size
        # thisdeal={name:name_customer, time:time_customer, size:size_customer}
        @requests << {id: deal.id,name:name_customer, time:time_customer, size:size_customer}
      end
    end
    p @requests
    render :json => @requests

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
