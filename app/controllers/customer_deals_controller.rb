class CustomerDealsController < ApplicationController

  def new
  end

  def create
    @new_customer_deal = CustomerDeal.create(customer_id: current_customer.id, party_size: params[:party_size], reservation_time: params[:reservation_time])
    # params[:neighborhoods]
    render json: {customer: @new_customer_deal}, status: :created
  end

end
# business.neighborhoods
# [alamo square, haight]
