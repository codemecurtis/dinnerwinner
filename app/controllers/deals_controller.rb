class DealsController < ApplicationController
  def index
    @deals = Business.find(params[:business_id]).deals
  end
end
