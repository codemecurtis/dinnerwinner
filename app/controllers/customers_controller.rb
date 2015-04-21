class CustomersController < ApplicationController
  before_action :authenticate_customer
  include CustomersHelper

  def index
  end

  def show
    @all_customer_deals = CustomerDeal.where(customer_id: current_customer.id)
    @pending_deals = []
    @accepted_deals = []
    @all_customer_deals.each do |deal|
      if deal.accepted == false && deal.deal_id != nil
        @pending_deals << deal
      elsif deal.deal_id != nil
        @accepted_deals << deal
      end
    @mass_deals = CustomerDeal.where(mass_deal: true)
    end

    @neighborhoods = [
      "Alamo Square",
      "Anza Vista",
      "Ashbury Heights",
      "Balboa Terrace",
      "Bayview-Hunters Point",
      "Bernal Heights",
      "Castro",
      "Chinatown",
      "Civic Center",
      "Cole Valley",
      "Corona Heights",
      "Crocker-Amazon",
      "Diamond Heights",
      "Dogpatch",
      "Duboce Triangle",
      "Embarcadero",
      "Excelsior",
      "Fillmore",
      "Financial District",
      "Fisherman's Wharf",
      "Forest Hill",
      "Glen Park",
      "Hayes Valley",
      "Ingleside",
      "Ingleside Heights",
      "Ingleside Terraces",
      "Inner Richmond",
      "Inner Sunset",
      "Japantown",
      "Lakeshore",
      "Lakeside",
      "Laurel Heights",
      "Lower Haight",
      "Lower Nob Hill",
      "Lower Pacific Heights",
      "Marina/Cow Hollow",
      "Merced Heights",
      "Merced Manor",
      "Miraloma Park",
      "Mission",
      "Mission Bay",
      "Mission Terrace",
      "Monterey Heights",
      "Mount Davidson Manor",
      "NoPa",
      "Nob Hill",
      "Noe Valley",
      "North Beach/Telegraph Hill",
      "Oceanview",
      "Outer Mission",
      "Outer Richmond",
      "Outer Sunset",
      "Pacific Heights",
      "Parkmerced",
      "Parkside",
      "Portola",
      "Potrero Hill",
      "Presidio",
      "Presidio Heights",
      "Russian Hill",
      "Sea Cliff",
      "Sherwood Forest",
      "SoMa",
      "South Beach",
      "St Francis Wood",
      "Stonestown",
      "Sunnyside",
      "Tenderloin",
      "The Haight",
      "Twin Peaks",
      "Union Square",
      "Visitacion Valley",
      "West Portal",
      "Western Addition",
      "Westwood Highlands",
      "Westwood Park"
    ]
    @party_size = (1..10)
  end

  def edit
    @customer = current_customer
  end

  def update
    current_customer.update_attributes(update_customer_params)
    redirect_to current_customer
  end

  private

  def update_customer_params
    params[:customer].permit(:first_name, :last_name, :email, :phone_number)
  end

end

