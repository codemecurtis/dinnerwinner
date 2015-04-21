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

  def reservation_time_options

  	hour = proc do |hour, ampm|
	  	<<-HTML
	  	<option value="#{hour}:00 #{ampm}">#{hour}:00 #{ampm}</option>
	    <option value="#{hour}:15 #{ampm}">#{hour}:15 #{ampm}</option>
	    <option value="#{hour}:30 #{ampm}">#{hour}:30 #{ampm}</option>
	    <option value="#{hour}:45 #{ampm}">#{hour}:45 #{ampm}</option>
	    HTML
	end

  	html = ""

	(1..11).to_a.each do |n|
      html += hour.call(n, 'AM')
  	end
    ([12]+(1..11).to_a).each do |n|
      html += hour.call(n, 'PM')
    end

    html.html_safe
        

  end
end
