class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    redirect_to(new_customer_session_path) if current_customer.nil?
  end

  def after_sign_in_path_for(customer)
    "/customers/#{customer.id}"
  end

  def after_sign_up_path_for(customer)
    "/customers/#{customer.id}"
  end
end
