FactoryGirl.define do
  sequence :name do |n|
    "name #{n}"
  end
  
  factory :fantasy_league do
    division "A"
    year 2016
  end

  factory :roster_position do
    fantasy_player
    fantasy_team
  end
  
  factory :fantasy_team do
    name
  end
  
  factory :sports_league do
    name
    championship_date "2017-02-01"
  end

  factory :fantasy_player do
    name
    sports_league
  end
  
  factory :final_ranking do
    fantasy_player 
    year 2016

    trait :finished_first do
      rank 1
      points 8
      winnings 25
    end
  end
end
