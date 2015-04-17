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

30.times do
  temp = Business.create(name:Faker::Company.name, phone_number:Faker::PhoneNumber, location:"#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}", logo:Faker::Company.logo, email:Faker::Internet.email)

  number = Random.rand(11)
  number.times do
    temp.deals << Deal.create(name:Faker::Company.catch_phrase, short_description:Faker::Company.bs, deal_image:Faker::Company.logo)
  end

end

