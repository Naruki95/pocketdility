# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Delete all Data

puts "delete all Users.."
User.destroy_all
puts "delete all Status.."
Status.destroy_all
puts "delete all Restaurants.."
Restaurant.destroy_all
puts "delete all Specialities.."
Speciality.destroy_all

# Les différents status qu'on peut avoir
s1 = Status.create!(title: 'Restaurateur')
s2 = Status.create!(title: 'Client')

# Utilisateurs tests
u1 = User.create!(email: 'test@gmail.com', status: s1, username: "test", password: '123456')

# Specialities

sp1 = Speciality.create!(title: 'Chinois')

# Restaurants

r1 = Restaurant.create!(name: "KFC", address: "Paris 6", description: "Chicken for rich", telephone_number: "0130303030", website_url: "none", user: u1, speciality: sp1)
