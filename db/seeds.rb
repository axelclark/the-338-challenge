require 'csv'

# CSV.foreach("db/csv/fantasy_leagues.csv", { encoding: "UTF-8", 
#   headers: true, header_converters: :symbol, converters: :all}) do |row|
#   FantasyLeague.create(row.to_hash)
# end

# CSV.foreach("db/csv/rosters.csv") do |row|
#   @fantasy_league = FantasyLeague.find(row[1])
#   Roster.create!({
#     :fantasy_team_name => row[0],
#     :fantasy_league => @fantasy_league
#   })
# end

CSV.foreach("db/csv/sports_leagues.csv", { encoding: "UTF-8", 
  headers: true, header_converters: :symbol, converters: :all}) do |row|
  SportsLeague.create(row.to_hash)
end

CSV.foreach("db/csv/fantasy_players.csv") do |row|
  @sports_league = SportsLeague.find(row[1])
  FantasyPlayer.create!({
    :name => row[0],
    :final_ranking => row[2],
    :sports_league => @sports_league
  })
end

# CSV.foreach("db/csv/roster_spots.csv") do |row|
#   @roster = Roster.find(row[0])
#   @sports_team = FantasyPlayer.find(row[1])
#   RosterSpot.create!({
#     :roster => @roster,
#     :sports_team => @sports_team      
#   })
# end
