class CustomersController < ApplicationController
  before_action :authenticate_customer
  def index
  end

  def show
    @neighborhoods = []
    Business.all.each do |b|
      @neighborhoods << b.neighborhoods.gsub(/\W+/, ' ')
    end
    @uniq_neighborhoods = @neighborhoods.uniq
  end



end


# class Yelp
#   def initialize
#     @hash = Yelp.client.business('yelp-san-francisco')
#   end
# end

# results = Yelp.new
# results.instance_variable_get(:@hash)
# results.instance_variables
#Will list what is inside
