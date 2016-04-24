FactoryGirl.define do
  factory :fantasy_team do
    name "Brown"
  end
  
  factory :sports_league do
    name "NFL"
    waiver_deadline "2016-11-11"
    trade_deadline "2016-11-20"
    championship_date "2017-02-01"
  end

  factory :fantasy_player do
    name "Seattle Seahawks"
    sports_league
  end
  
  factory :final_ranking do
    fantasy_player 
    year 2016
    rank 1
  end
end
