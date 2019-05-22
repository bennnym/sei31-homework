# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Director.destroy_all
Director.create(:name => 'Christopher Nolan', :nationality => 'United Kingdom', :dob => '1970-07-30', :style => 'Blockbuster', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Christopher_Nolan_Cannes_2018.jpg/440px-Christopher_Nolan_Cannes_2018.jpg')
Director.create(:name => 'Peter Jackson', :nationality => 'New Zealand', :dob => '1961-10-31', :style => 'Fantasy', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Peter_Jackson_SDCC_2014.jpg/440px-Peter_Jackson_SDCC_2014.jpg')
