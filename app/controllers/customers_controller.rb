class CustomersController < ApplicationController
  def index
    @customer = Customer.new
  end
end
