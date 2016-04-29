FactoryGirl.define do
  factory :roster_position do
    fantasy_player
    fantasy_team
  end
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

    factory :ranked_fantasy_player do
      after(:create) do |fantasy_player|
        create(:final_ranking, fantasy_player: fantasy_player)
      end
    end
  end
  
  factory :final_ranking do
    fantasy_player 
    year 2016
    rank 1
  end
end
