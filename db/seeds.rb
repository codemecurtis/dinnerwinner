# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

50.times do
  Customer.create(
  	first_name: Faker::Name.first_name, 
  	last_name: Faker::Name.last_name, 
  	password: 'password', 
  	phone_number: Faker::PhoneNumber, 
  	email: Faker::Internet.email, 
  	avatar: Faker::Avatar.image
  )
end

params = {term: "food"}

50.times do
  response = Yelp.client.search('san-francisco', params)
  response.businesses.each do |business|
  	formatted_neighborhood = business.location.neighborhoods.first
    formatted_address = business.location.display_address.join(",")
    b = Business.new(
		    	name: business.name, 
		    	rating: business.rating, 
		    	city: business.location.city,
		    	address: formatted_address, 
		    	neighborhoods: formatted_neighborhood, 
		    	password: 'password', 
		    	email: Faker::Internet.email, 
		    	logo: business.image_url, 
		    	phone_number: business.display_phone, 
		    	short_description: business.snippet_text
    		)
    b.save
  end
end

