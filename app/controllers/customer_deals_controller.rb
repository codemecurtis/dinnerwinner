class CustomerDealsController < ApplicationController

  def show
    @customer_deal = CustomerDeal.find(params[:id])
    @business_id = @customer_deal.deal.business_id
    @pending_deal = @customer_deal.deal
    @requested_business = Business.find(@business_id)
    render json: { requested_business: @requested_business, pending_deal: @pending_deal, customer_deal: @customer_deal }
  end


  def new
  end

  def create
    @new_customer_deal = CustomerDeal.create(customer_id: current_customer.id, party_size: params[:party_size], reservation_time: params[:reservation_time], neighborhoods: params[:neighborhoods])
    render json: {customer: @new_customer_deal}, status: :created
  end

  def edit
    @customer_deal = CustomerDeal.find(params[:id])
    @customer_deal.accepted = true
    @customer = current_customer
    @business_id = @customer_deal.deal.business_id
    @business = Business.find(@business_id)
    if @customer_deal.save
      redirect_to current_customer
      CustomerMailer.deal_accept(@customer_deal.deal, @customer, @business).deliver_later
    end

    render :json => @customer_deal
  end

  def update
    if params[:deal_template]!=nil
      customer_deal = CustomerDeal.find(params[:id])
      customer_deal.update_attributes(deal_id: params[:deal_template])
    end
    if Customer.find(customer_deal.customer_id).phone_number != nil
      notify
    end
    render :json => customer_deal
  end

  # def accept_mass_deal
  #   customer_deal = CustomerDeal.find(params[:id])
  #   # customer_deal.update_attributes(accepted: true)
  #   customer_deal.mass_users << current_customer.id

  #   render :json => customer_deal
  # end



  def accept_deal
    customer_deal = CustomerDeal.find(params[:id])
    customer_deal.update_attributes(accepted: true)
    #need a better algorithm
    pending_deals=[]
    accepted_deals=[]
    @all_customer_deals = CustomerDeal.where(customer_id: current_customer.id)
    @all_customer_deals.each do |deal|
      if deal.accepted == false && deal.deal_id != nil
        pending_deals << deal
      elsif deal.deal_id != nil
        accepted_deals << deal
      end
    end

    deal_me = Deal.find(customer_deal.deal_id)
    biz_me = Business.find(deal_me.business_id)

    render :json => {:b => biz_me,:d =>deal_me ,:cd => customer_deal, :pending_count => pending_deals.length ,:accept_count => accepted_deals.length}
  end

  def notify
    @customer_deal = CustomerDeal.find(params[:id])
    @customer = Customer.find(@customer_deal.customer_id)
    @deal = Deal.find(@customer_deal.deal_id)
    @business = Business.find(@deal.business_id)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @phone = "+1"+"#{@customer.phone_number.gsub(/\D+/, '')}"
    # @correct_phone

    @message = @client.messages.create(:body => "Hello, #{@business.name} sent you a deal :) '#{@deal.name}!!!'", :to => @phone, :from => '+15109721904')

    # render plain: @message.status
  end


  def destroy
    deal=CustomerDeal.find(params[:id])
    id = deal.id
    deal.destroy
    render :json => {id: params[:id]}
  end

end

