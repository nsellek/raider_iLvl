# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Realm.delete_all

response = HTTParty.get('https://worldofwarcraft.com/en-us/game/status')

pars_body = Nokogiri::HTML(response)
table = pars_body.css(".SortTable-row")

 table.each do |row|
   Realm.create({realm_name: row.at_css(".SortTable-col:nth-child(2)").text})
   puts "Created #{row.at_css(".SortTable-col:nth-child(2)").text}"
 end
 Realm.all.first.delete
