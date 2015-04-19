class CustomerDealsController < ApplicationController

  def show
    @customer_deal = CustomerDeal.find(params[:id])
    @business_id = @customer_deal.deal.business_id
    @pending_deal = @customer_deal.deal
    @requested_business = Business.find(@business_id)
    render json: { requested_business: @requested_business, pending_deal: @pending_deal, customer_deal: @customer_deal }
  end

  def new
  end

  def create
    @new_customer_deal = CustomerDeal.create(customer_id: current_customer.id, party_size: params[:party_size], reservation_time: params[:reservation_time], neighborhoods: params[:neighborhoods])
    render json: {customer: @new_customer_deal}, status: :created
  end

  def edit
    @customer_deal = CustomerDeal.find(params[:id])
    @customer_deal.accepted = true
    @customer_deal.save
    redirect_to customer_path
  end

end

