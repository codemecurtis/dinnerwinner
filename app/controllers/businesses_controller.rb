class BusinessesController < ApplicationController
  def index
  end

  def show
    authenticate_business
  end


end
