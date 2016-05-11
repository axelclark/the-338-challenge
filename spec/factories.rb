FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :name do |n|
    "name #{n}"
  end
  
  factory :active_player do
    fantasy_player
    fantasy_league
  end

  factory :fantasy_league do
    division "A"
    year 2016
  end

  factory :fantasy_player do
    name
    sports_league
  end
  
  factory :fantasy_team do
    name
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
  
  factory :franchise do
    name
  end
  
  factory :roster_position do
    fantasy_player
    fantasy_team
  end
  
  factory :sports_league do
    name
    waiver_deadline "2016-11-11"
    trade_deadline "2016-11-20"
    championship_date "2017-02-01"
  end
  
  factory :user do
    email
    password "password"

    factory :admin do
      admin true
    end
  end
end
