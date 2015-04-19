class CustomerDealsController < ApplicationController

  def new
  end

  def create
    p "*" * 100
    p params
    @new_customer_deal = CustomerDeal.create(customer_id: current_customer.id, party_size: params[:party_size], reservation_time: params[:reservation_time])
    render json: {customer: @new_customer_deal}, status: :created
  end

end
