# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Détruire la base actuelle
ActiveRecord::Base.connection.tables.each do |table|
    next if table == 'schema_migrations'
    ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")
end

def generate_french_phone_number
    prefix = '01'
    number = Faker::Number.number(digits: 8)
    formatted_number = "#{prefix}#{number}"
    formatted_number
end

20.times do
    email = Faker::Internet.email
    phone_number = generate_french_phone_number
    description = Faker::Lorem.paragraph
    User.create!(
        email: email,
        phone_number: phone_number,
        description: description
    )
   puts "Seed Users créé"
end

10.times do
    city_name = Faker::Address.city
    # Générer un code postal valide pour la France
    zip_code = nil
    loop do
        zip_code = Faker::Address.zip_code
        break if zip_code.match(/\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/)
    end
    # Créer la ville avec les données générées
    City.create!(
        name: city_name,
        zip_code: zip_code
    )
   puts "Seed cities créés"
   end

   # Créer 50 listings
50.times do
    # Générer une description de 140 caractères ou plus
    description = Faker::Lorem.characters(number: 140)
      
    listing = Listing.create!(
        available_beds: Faker::Number.between(from: 1, to: 5),
        price: Faker::Number.between(from: 50, to: 200),
        description: description, # Utiliser la description générée
        has_wifi: [true, false].sample,
        welcome_message: Faker::Lorem.sentence,
        user: User.all.sample,
        city: City.all.sample
    )
   puts "Listings bien créés"
   end

   # Créer 5 réservations dans le passé
5.times do
    start_date = Faker::Date.backward(days: 365)
    end_date = Faker::Date.between(from: start_date + 1.day, to: start_date + 365.days)
    Reservation.create!(
       start_date: start_date,
       end_date: end_date,
       user: User.all.sample,
       listing: Listing.all.sample
    )
  puts "Résa passées bien créés"
   end

   # Créer 5 réservations dans le futur
 5.times do
    start_date = Faker::Date.forward(days: 365)
    end_date = Faker::Date.between(from: start_date + 1.day, to: start_date + 365.days)
    Reservation.create!(
       start_date: start_date,
       end_date: end_date,
       user: User.all.sample,
       listing: Listing.all.sample
    )
  puts "Résa futures bien créés"
   end
  