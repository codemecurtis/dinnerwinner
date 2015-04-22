class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def authenticate_customer
    redirect_to(new_customer_session_path) if current_customer.nil?
  end

  def authenticate_business
    redirect_to(new_business_session_path) if current_business.nil?
  end


  def after_sign_in_path_for(resource)
    if resource.class == Customer
      "/customers/#{resource.id}"
    else
      "/businesses/#{resource.id}"
    end
  end

  def after_sign_up_path_for(resource)
    if resource.class == Customer
      "/customers/#{resource.id}"
    else
      "/businesses/#{resource.id}"
    end
  end




end
