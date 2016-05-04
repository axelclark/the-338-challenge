require "rails_helper"

feature "user visits a fantasy league page" do
  scenario "and sees a listing of fantasy teams on the page" do
    fantasy_league = create(:fantasy_league, year: 2016, division: "A")
    fantasy_team = create(:fantasy_team, 
                          name: "Brown", fantasy_league: fantasy_league)
    fantasy_player = create(:fantasy_player, name: "Seattle Seahawks")
    create(:final_ranking, :finished_first, winnings: 25, 
           fantasy_player: fantasy_player)
    create(:roster_position,
           fantasy_player: fantasy_player, fantasy_team: fantasy_team)
    other_fantasy_team = create(:fantasy_team, 
                          name: "Axel", fantasy_league: fantasy_league)

    visit root_path
    click_on "2016 Division A"

    expect(page).to have_css "a", text: "Brown"
    expect(page).to have_content "25"
    expect(page).to have_css "a", text: "Axel"
  end
end
