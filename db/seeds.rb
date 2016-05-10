require 'csv'
CSV.foreach("db/csv/fantasy_leagues.csv") do |row|
  FantasyLeague.create!({ 
    :year => row[0],
    :division => row[1],
  }) 
end

CSV.foreach("db/csv/franchises.csv") do |row|
  Franchise.create!({ 
    :name => row[0],
  }) 
end

CSV.foreach("db/csv/fantasy_teams.csv") do |row|
  fantasy_league = FantasyLeague.find(row[1])
  franchise = Franchise.find(row[2])
  FantasyTeam.create!({ 
    :name => row[0],
    :fantasy_league => fantasy_league,
    :franchise => franchise,
  }) 
end

CSV.foreach("db/csv/sports_leagues.csv", { encoding: "UTF-8", 
  headers: true, header_converters: :symbol, converters: :all}) do |row|
  SportsLeague.create(row.to_hash)
end

CSV.foreach("db/csv/fantasy_players.csv") do |row|
  sports_league = SportsLeague.find(row[1])
  FantasyPlayer.create!({
    :name => row[0],
    :sports_league => sports_league,
  })
end

CSV.foreach("db/csv/final_rankings.csv") do |row|
  fantasy_player = FantasyPlayer.find(row[0])
  FinalRanking.create!({
    :fantasy_player => fantasy_player,
    :year => row[1],
    :rank => row[2],
    :points => row[3],
    :winnings => row[4],
  })
end

CSV.foreach("db/csv/roster_positions.csv") do |row|
  fantasy_team = FantasyTeam.find(row[0])
  fantasy_player = FantasyPlayer.find(row[2])
  RosterPosition.create!({
    :fantasy_team => fantasy_team,
    :fantasy_player => fantasy_player,
  })
end

User.create(
  :email => "axelclark2@yahoo.com",
  :password => "password",
  :admin => true
)
