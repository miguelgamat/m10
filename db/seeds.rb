# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Club.create name: 'Parque clavero I', description: 'En Parque Clavero la pista de tenis y de padel tienen luz, además de piscina y otras instalaciones de ocio.'
Club.create name: 'Club El Limonar', description: 'El el Club El Limonar tienes a tu disposición muchas pistas de tenis y de padel.'
Club.create name: 'El Candado', description: 'Club de deporte El Candado, un club deportivo con excelentes instalaciones en la Urbanización El Cadando.'


password = Faker::Internet.password(8)

20.times do 
User.create( name: Faker::Name.name,  email: Faker::Internet.email, password: password , password_confirmation: password)
end

3.times do
Court.create name: Faker::Team.name, club_id: 1, type_of_court: "Padel"
end

3.times do
Court.create name: Faker::Team.name, club_id: 2, type_of_court: "Tenis"
end


Booking.create date_booked: 12, user_id: 1, court_id: 1
Booking.create date_booked: 11, user_id: 2, court_id: 2
Booking.create date_booked: 3, user_id: 3, court_id: 1
Booking.create date_booked: 1, user_id: 4, court_id: 2
Booking.create date_booked: 7, user_id: 1, court_id: 2


Membership.create club_id: 1, user_id: 1
Membership.create club_id: 2, user_id: 2
Membership.create club_id: 2, user_id: 3
Membership.create club_id: 2, user_id: 20
Membership.create club_id: 1, user_id: 12

