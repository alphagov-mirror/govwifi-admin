# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "faker"

CustomOrganisationName.create!(name: "GovWifi Super Administrators")

def create_user_for_organisations(
  organisations,
  email: nil,
  confirmed_at: nil,
  is_super_admin: false
)
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email ||= first_name + "." + last_name + "@example.gov.uk"
  User.create!(
    email: email,
    password: "password",
    name: first_name + " " + last_name,
    confirmed_at: confirmed_at,
    organisations: organisations,
    is_super_admin: is_super_admin,
  )
end

super_admin_organisation = Organisation.create!(
  name: "GovWifi Super Administrators", service_email: "it@gds.com", super_admin: true,
)
organisation = Organisation.create!(
  name: "UKTI Education", service_email: "it@parks.com",
)
empty_organisation = Organisation.create!(
  name: "Academy for Social Justice Commissioning", service_email: "empty@example.net",
)

create_user_for_organisations(
  [],
  email: "loneadmin@gov.uk",
  confirmed_at: Time.zone.now,
  is_super_admin: true,
)

create_user_for_organisations(
  [super_admin_organisation],
  email: "admin@gov.uk",
  confirmed_at: Time.zone.now,
  is_super_admin: true,
)

create_user_for_organisations(
  [organisation, empty_organisation],
  email: "test@gov.uk",
  confirmed_at: Time.zone.now,
)

3.times do
  create_user_for_organisations([organisation], confirmed_at: Time.zone.now)
end

2.times do
  create_user_for_organisations([organisation])
end

# Location with no IP addresses
Location.create!(
  address: "The White Chapel Building, London",
  postcode: "E1 8QS",
  organisation_id: organisation.id,
)

location_one = Location.create!(
  address: "Momentum Centre, London",
  postcode: "SE1 0SX",
  organisation_id: organisation.id,
)

location_two = Location.create!(
  address: "136 Southwark Street, London",
  postcode: "E3 3EH",
  organisation_id: organisation.id,
)

10.times do
  Ip.create!(
    address: Faker::Internet.unique.public_ip_v4_address,
    location: location_one,
    created_at: [Time.zone.now, (Time.zone.now - 1.day)].sample,
  )
end

3.times do
  Ip.create!(
    address: Faker::Internet.unique.public_ip_v4_address,
    location: location_two,
  )
end

location_one.ips.each_with_index do |ip, index|
  Session.create(
    start: (Time.zone.now - (index + 5).day).to_s,
    success: index.even?,
    username: "Gerry",
    siteIP: ip.address,
  )
end

location_two.ips.each_with_index do |ip, index|
  Session.create(
    start: (Time.zone.now - index.day).to_s,
    success: index.even?,
    username: "Garry",
    siteIP: ip.address,
  )
end

MouTemplate.create!
