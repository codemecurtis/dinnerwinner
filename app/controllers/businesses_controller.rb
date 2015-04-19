class BusinessesController < ApplicationController
  include BusinessesHelper
  def index
  end

  def show
    viewed_business
    authenticate_business
  end

  def edit
    viewed_business
  end

  def create_mass_deal
    # CustomerDeal.new(business_id:, customer_id:)
  end

  def mass_deal
  end

end
