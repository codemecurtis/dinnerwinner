class CustomersController < ApplicationController
  before_action :authenticate_customer
  def index

  end

  def show

  end

  def search
    parameters = {term: params[:term], limit: 10}
    render json: Yelp.client.search('San Francisco', parameters)
  end


end
