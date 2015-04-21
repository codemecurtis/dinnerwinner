class CustomerMailer < ApplicationMailer
	def welcome_email(customer)
    @customer = customer
    mail(to: @customer.email, subject: "Welcome to Dinner Winner")
  end

  def deal_accept(deal, customer, business)
  	@customer_deal = deal
  	@customer = customer
  	@business = business
    mail(to: @customer.email, subject: "You have a new deal from #{@business.name}")
  end
end
