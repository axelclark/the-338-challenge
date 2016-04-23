# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
15.times do |n|
  name = Faker::Team.sport
  waiver_deadline = Faker::Time.forward(365)
  trade_deadline = waiver_deadline + 7.days
  championship_date = trade_deadline + 30.days
  SportsLeague.create!(name: name,
                       waiver_deadline: waiver_deadline,
                       trade_deadline: trade_deadline,
                       championship_date: championship_date,
                      )
end

sports_leagues = SportsLeague.all
30.times do
  name = Faker::Team.name
  sports_leagues.each { |league| league.fantasy_players.create!(name: name) }
end
