# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


#Create some customers
20.times do
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


#Create mass deals that will render on customer dashboard
Deal.create(
  name: "Sonoma Wine Pairings & Brunch ",
  short_description:"A special event Sundays that incorporate this seasons favorite wine pairings with our classic brunch.",
  deal_image: 'https://s3-media2.fl.yelpassets.com/bphoto/RgSY7vrLUfwWRh0-KuUpKQ/l.jpg',
  business_id: 15
)
CustomerDeal.create(deal_id: 1, mass_deal: true)

Deal.create(
  name: "Sangria Saturday!",
  short_description:"Ladies, your first sangria is on us!",
  deal_image: 'https://s3-media2.fl.yelpassets.com/bphoto/_qTuOqLWPp_QhGtCWm-v1g/l.jpg',
  business_id: 8
)
CustomerDeal.create(deal_id: 2, mass_deal: true)

Deal.create(
  name:"Tacos & Tecates Tuesday",
  short_description:"$1 Tecates with Tacos.",
  deal_image: 'https://s3-media4.fl.yelpassets.com/bphoto/JZ2ZH2sPSWpY6DlF3DrkRA/l.jpg',
  business_id: 8
)
CustomerDeal.create(deal_id: 3, mass_deal: true)

Deal.create(
  name:"Treat Yo-self!",
  short_description:"Our famous dessert crepe 50% off!",
  deal_image: 'https://s3-media4.fl.yelpassets.com/bphoto/WCMJTainPxrR-LiVplgKwA/l.jpg',
  business_id: 11
)
CustomerDeal.create(deal_id: 4, mass_deal: true)

Deal.create(
  name:"Chef's Table Dining Experience",
  short_description:"Experience a private dining experience at the chef's table. For parties of 3 or smaller.",
  deal_image: 'https://s3-media1.fl.yelpassets.com/bphoto/ywp5Nkr3UlIvfvvhHytfug/l.jpg',
  business_id: 20
)
CustomerDeal.create(deal_id: 5, mass_deal: true)

Deal.create(
  name: "Six Course Tasting Menu",
  short_description:"Experience six world cuisines in a thoughtfully designed tasting menu.",
  deal_image: 'https://s3-media3.fl.yelpassets.com/bphoto/zRQX2YrSaLA3WLocvl8x8A/l.jpg',
  business_id: 20
)
CustomerDeal.create(deal_id: 6, mass_deal: true)

Deal.create(
  name:"Sustainable Harvest",
  short_description:"Enjoy a seasonal family-style dinner with commentary from local chef and sustainable farmer Alexis Hernandez.",
  deal_image: 'https://s3-media3.fl.yelpassets.com/bphoto/JsQspaP11En_DPZsz-Q_mw/l.jpg',
  business_id: 13
)
CustomerDeal.create(deal_id: 7, mass_deal: true)

Deal.create(
  name:"Fancy Beers with Fancy Burgers",
  short_description:"From 3-9 get a complimentary pour of San Francisco's finest brews with your fancy free-range burger.",
  deal_image: 'https://s3-media1.fl.yelpassets.com/bphoto/qbHVl-8hq-qgupntooahgw/l.jpg',
  business_id: 15
)
CustomerDeal.create(deal_id: 8, mass_deal: true)

Deal.create(
  name:"Rawbar Two-tier Giveaway",
  short_description:"First twenty guests will be treated to a 2-tier seafood presentation of Tomales Bay, Hog Island, and Point Reyes oysters.",
  deal_image: 'https://s3-media4.fl.yelpassets.com/bphoto/38wn7cmhSX7KnxVIzOB-yQ/l.jpg',
  business_id:20
)
CustomerDeal.create(deal_id: 9, mass_deal: true)

Deal.create(
  name:"Sunrise Surprise",
  short_description:"Start your morning with a complimentary scone when you buy a pound of coffee.",
  deal_image: 'https://s3-media1.fl.yelpassets.com/bphoto/1E90p8sXdfIyAiTtSxTsaQ/l.jpg',
  business_id: 18
)
CustomerDeal.create(deal_id: 10, mass_deal: true)

Deal.create(
  name: "Bread Making Class with Master Chef",
  short_description:"Learn to knead, roll, and bake artisinal bread.",
  deal_image: 'https://s3-media1.fl.yelpassets.com/bphoto/ZE7f3O7MWlhztBZxoxwjNg/l.jpg',
  business_id:18
)
CustomerDeal.create(deal_id: 11, mass_deal: true)


#Create 20 customer requests for deals
20.times do
  party_size = rand(10)
  customer_id = rand(20)
  reservation_time = [
    "11:00 AM",
    "1:00 PM",
    "6:30 PM",
    "7:15 PM",
    "8:00 PM",
    "9:00 PM"
  ]
  neighborhoods = [
      "Russian Hill",
      "Union Square",
      "Mission",
      "SoMa",
      "Inner Sunset",
      "Castro",
    ]
  CustomerDeal.create(
    customer_id: customer_id,
    deal_id: nil,
    party_size: party_size,
    reservation_time: reservation_time.sample,
    neighborhoods: neighborhoods.sample,
    mass_deal: false,
    accepted: false
    )
end

#Create four requests for our test restaurant "The House" with id: 20
4.times do
  party_size = rand(10)
  customer_id = rand(20)
  reservation_time = [
    "11:00 AM",
    "1:00 PM",
    "6:30 PM",
    "7:15 PM",
    "8:00 PM",
    "9:00 PM"
  ]
  CustomerDeal.create(
    customer_id: customer_id,
    deal_id: nil,
    party_size: party_size,
    reservation_time: reservation_time.sample,
    neighborhoods: "North Beach/Telegraph Hill",
    mass_deal: false,
    accepted: false
    )
end


