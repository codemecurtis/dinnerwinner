class BusinessesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create_mass_deal
  include BusinessesHelper

  before_action :setup_resources

  def setup_resources
    @resource = Business.new
    @resource_name = :business
  end

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
      business_neighborhoods = JSON.parse(@business.neighborhoods).map { |e| e.downcase }
        if deal.neighborhoods != nil
          if((business_neighborhoods.include?(deal.neighborhoods.downcase)) && (deal.deal_id==nil))
            name_customer = Customer.find(deal.customer_id).first_name
            time_customer = deal.reservation_time
            size_customer = deal.party_size
            @requests << {id: deal.id,name:name_customer, time:time_customer, size:size_customer}
          end
        end
      end
    render :json => @requests
  end


  def edit
    viewed_business
  end

  def update
    current_business.update_attributes(update_business_params)
    redirect_to current_business
  end

  def create_mass_deal
    newdealmass = CustomerDeal.create(deal_id:params[:deal_template], party_size: params[:party_size], mass_deal: true)
    output={deal_image:Deal.find(newdealmass.deal_id).deal_image, id:newdealmass.id, name:Deal.find(newdealmass.deal_id).name, short_description:Deal.find(newdealmass.deal_id).short_description}
    render :json => output
  end

  def remove_mass_deal
  end


  def mass_deal
    @deals = Deal.where(business_id: params[:business_id])
  end

  private

  def update_business_params
    params[:business].permit(:name, :email, :phone_number, :logo, :address, :short_description)
  end


end
