require "rails_helper"

feature "user visits fantasy players index page" do
  scenario "and sees owned and unowned fantasy players in 2nd division" do
    fantasy_league_a = create(:fantasy_league, year: 2016, division: "A")
    fantasy_league_b = create(:fantasy_league, year: 2016, division: "B")
    fantasy_team = create(:fantasy_team, name: "Brown", 
                          fantasy_league: fantasy_league_b)
    owned_player = create(:fantasy_player, name: "Seattle Seahawks")
    create(:roster_position,
           fantasy_player: owned_player, fantasy_team: fantasy_team)
    unowned_player = create(:fantasy_player, name: "Oakland Raiders")

    visit fantasy_players_path
    select "2016 Division B"
    click_on "Update"

    expect(page).to have_content owned_player.name 
    expect(page).to have_content fantasy_team.name 
    expect(page).to have_content unowned_player.name
  end
end
