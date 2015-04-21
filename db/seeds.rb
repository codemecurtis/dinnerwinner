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
  name:"Free dessert with a $30 purchase",
  short_description:"Tonights deserts include: tiramisu, pound cake with a scoop of vanilla ice cream and warm fudge cake with chocolate ice cream.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Happy hour starts at 3:00 PM",
  short_description:"Get in for our weekly early happy hour, kids under 10 drink free before 5pm",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name: "10% off any entree",
  short_description:"10oz steak and 5oz lobster are among the entree offered tonight.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"2 for 1 dining special",
  short_description:"Limit 1 per reservation.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name: "Buy one get one free drinks",
  short_description:"Additional drink surcharges may apply",
  deal_image:biz.logo,
  business_id:biz.id
  )


Deal.create(
  name: "Buffet all day",
  short_description:"Our famous all day buffet, two fully stocked hot-bars and one salad bar make this your best dining option tonight!",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name: "Ladies drink for free before 8:00 PM",
  short_description:"Ladies, get here before 8:00 and drink for free.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Taco Tuesday",
  short_description:"Free taco for every purchase of a drink or appetizer.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Free chips and salsa",
  short_description:"Free chips and salsa for as long as you want to stay.",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"$9.99 Lunch Special",
  short_description:"Tiger shrimp, chili sauce. Soup (choice of one) - Sweet Corn / Hot & Sour (choice of vegetable or chicken) Rice (choice of none) - White Rice / Brown Rice ...",
  deal_image:biz.logo,
  business_id:biz.id
  )

Deal.create(
  name:"Free bowl of soup with purchase of an entree",
  short_description:"Get a free bowl of soup at #{biz.name} with the purchase of any entree, valid through 1/27/11!  To find an O’Charley’s in your area, go HERE.",
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

