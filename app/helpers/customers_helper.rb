module CustomersHelper
  def resource_name
    @resource_name ||= :customer
  end

  def resource
    @resource ||= Customer.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[resource_name]
  end
end
