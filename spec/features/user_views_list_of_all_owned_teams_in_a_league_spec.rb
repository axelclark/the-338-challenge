require "rails_helper"

feature "user visits roster positions index" do
  scenario "and updates view to see all players owned in Division B" do
    fantasy_league_a = create(:fantasy_league)
    fantasy_league_b = create(:fantasy_league, year: 2016, division: "B")
    fantasy_player_a = create(:fantasy_player) 
    fantasy_player_b = create(:fantasy_player, name: "Seattle Seahawks") 
    fantasy_team_a = create(:fantasy_team, fantasy_league: fantasy_league_a) 
    fantasy_team_b = create(:fantasy_team, name: "Brown", 
                            fantasy_league: fantasy_league_b) 
    create(:roster_position, fantasy_team: fantasy_team_a, 
           fantasy_player: fantasy_player_a) 
    create(:roster_position, fantasy_team: fantasy_team_b, 
           fantasy_player: fantasy_player_b) 

    visit roster_positions_path
    select "2016 Division B"
    click_on "Update"

    expect(page).to have_content fantasy_team_b.name
    expect(page).to have_content fantasy_player_b.name 
    expect(page).not_to have_content fantasy_player_a.name
    expect(page).not_to have_content fantasy_player_a.name
  end
end
