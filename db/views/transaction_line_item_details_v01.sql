SELECT 
  transaction_line_items.id AS transaction_line_item_id, 
  transaction_line_items.roster_transaction_id, 
  transaction_line_items.fantasy_team_id, 
  transaction_line_items.fantasy_player_id, 
  transaction_line_items.action,
  fantasy_players.name AS fantasy_player_name,
  sports_leagues.id AS sports_league_id, 
  sports_leagues.name AS sports_league_name,
  fantasy_teams.name AS fantasy_team_name, 
  fantasy_leagues.id AS fantasy_league_id, fantasy_leagues.year, 
  fantasy_leagues.division 

FROM transaction_line_items

INNER JOIN fantasy_players
  ON fantasy_players.id = transaction_line_items.fantasy_player_id
INNER JOIN sports_leagues  
  ON sports_leagues.id = fantasy_players.sports_league_id
INNER JOIN fantasy_teams  
  ON fantasy_teams.id = transaction_line_items.fantasy_team_id
INNER JOIN fantasy_leagues
  ON fantasy_leagues.id = fantasy_teams.fantasy_league_id 

ORDER BY transaction_line_items.id, fantasy_teams.name, 
  transaction_line_items.action, sports_leagues.name, 
  fantasy_players.name
