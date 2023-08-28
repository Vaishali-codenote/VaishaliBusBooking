# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bus.create(starting_city: 'indore', destination_city:'bhopal', despeture_time: Time.parse("20:30"), bus_type: 'AC', arrival_time: Time.parse("24:30"), name: 'bakshi', number: '3452', total_seats: 50)

Route.create(from: 'indore', to:'bhopal')
