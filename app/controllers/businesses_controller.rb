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

end
