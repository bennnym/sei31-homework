# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ocean.destroy_all

Ocean.create :name => 'Pacific', :image => "https://images.unsplash.com/photo-1518837695005-2083093ee35b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80", :size => 133
Ocean.create :name => 'Indian', :image => "https://images.unsplash.com/photo-1488921618671-463b781ac428?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80", :size => 2022
Ocean.create :name => 'Indian', :image => "https://a.wattpad.com/cover/48010147-352-k273841.jpg", :size => 2233
