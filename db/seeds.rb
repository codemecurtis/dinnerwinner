# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

include Faker

50.times do
  Customer.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, password:'password', phone_number:Faker::PhoneNumber, email:Faker::Internet.email, avatar:Avatar.image)
end

# 30.times do
#   temp = Business.create(name:Faker::Company.name, phone_number:Faker::PhoneNumber, location:"#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}", logo:Faker::Company.logo, email:Faker::Internet.email)

#   number = Random.rand(11)
#   number.times do
#     temp.deals << Deal.create(name:Faker::Company.catch_phrase, short_description:Faker::Company.bs, deal_image:Faker::Company.logo)
#   end

# end
params = {term: "food"}

50.times do
  response = Yelp.client.search('san-francisco', params)
  response.businesses.each do |business|
  	formatted_neighborhood = JSON.Parse(business.location.neighborhoods)map {|hood| hood.downcase}
    b = Business.new(name: business.name, rating: business.rating, city: business.location.city, address: business.location.display_address, neighborhoods: formatted_neighborhood, password: 'password', email:Faker::Internet.email, logo: business.image_url, phone_number: business.display_phone, short_description: business.snippet_text)
    b.save
  end
end

