# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
stocks = ActiveSupport::JSON.decode(File.read('db/seeds/stocks.json'))
stocks.each do |a|
  Allocation.create!(year: a['year'], bills: a['bills'],type_investments: a['type_investments'])
end
puts "Import stocks to Postgresql"
bonds = ActiveSupport::JSON.decode(File.read('db/seeds/bonds.json'))
bonds.each do |a|
  Allocation.create!(year: a['year'], bills: a['bills'],type_investments: a['type_investments'])
end
puts "Import bonds to Postgresql"
cash = ActiveSupport::JSON.decode(File.read('db/seeds/cash.json'))
cash.each do |a|
  Allocation.create!(year: a['year'], bills: a['bills'],type_investments: a['type_investments'])
end
puts "Import cash to Postgresql"
