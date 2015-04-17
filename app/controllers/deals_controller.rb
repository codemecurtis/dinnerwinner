class DealsController < ApplicationController
  def index
    @deals = Business.find(params[:business_id]).deals
  end

  def create

  end

  def edit

  end

  def destroy

  end
end
