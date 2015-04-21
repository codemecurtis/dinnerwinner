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
  	formatted_neighborhood = business.location.neighborhoods
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

Business.all.each do |biz|

Deal.create(
  name:"Chef's Table Dining Experience",
  short_description:"Experience a private dining experience at the chef's table. For parties of 3 or smaller.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Happy Hour Mixology Class",
  short_description:"Take off your heels or loosen your tie and learn to serve up fancy cocktails San Francisco style!",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name: "Complimentary cocktails during Happy Hour",
  short_description:"Enjoy complimentary bite-size appetizers with drinks.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Treat Yo-self!",
  short_description:"Our famous sundae free with entree purchase.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name: "Six Course Tasting Menu",
  short_description:"Experience six world cuisines in a thoughtfully designed tasting menu.",
  deal_image:biz.logo,
  business_id:biz.id
  )


Deal.create(
  name: "Sonoma Wine Pairings & Brunch ",
  short_description:"A special event Sundays that incorporate this seasons favorite wine pairings with our classic brunch.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name: "Ladies Night!",
  short_description:"Ladies, get here before 8 and your first drink is on us!",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Tacos & Tecates Tuesday",
  short_description:"$1 Tecates with Tacos.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Free BBQ Oysters on the Patio",
  short_description:"From 3-9 get oysters off the grill while they last!",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Sustainable Harvest",
  short_description:"Enjoy a seasonal family-style dinner with commentary from local chef and sustainable farmer Alexis Hernandez.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Rawbar Two-tier Giveaway",
  short_description:"First twenty guests will be treated to a 2-tier seafood presentation of Tomales Bay, Hog Island, and Point Reyes oysters.",
  deal_image:biz.logo,
  business_id:biz.id
  )

end

20.times do
  party_size = 1 + rand(10)
  customer_id = 1 + rand(40)
  deal_id = 1 + rand(5)
  CustomerDeal.create(
    customer_id: customer_id,
    deal_id: nil,
    party_size: party_size,
    reservation_time: nil,
    neighborhoods: nil,
    mass_deal: false,
    accepted: false
    )
end

10.times do
  day_night = ["AM, PM"].sample
  time = rand(1...12)
  party_size = 1 + rand(10)
  customer_id = 1 + rand(40)
  deal_id = 1 + rand(8)
  reservation_time =
  CustomerDeal.create(
    customer_id: nil,
    deal_id: deal_id,
    party_size: party_size,
    reservation_time: "#{time}:00#{day_night}",
    neighborhoods: nil,
    mass_deal: true,
    accepted: false
    )
end

