class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permited_parameters, :only => [:create]

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :avatar, :logo, :location, :short_description, :rating, :email, :password, :password_confirmation) }
  end

end
