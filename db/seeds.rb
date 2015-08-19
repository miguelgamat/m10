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

10.times do
Court.create name: Faker::Team.name, club_id: 1, type_of_court: "padel"
end
