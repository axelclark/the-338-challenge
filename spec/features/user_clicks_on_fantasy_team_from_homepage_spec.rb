require "rails_helper"

feature "user clicks on fantasy team from homepage" do
  scenario "and sees relevant details on the team's page" do
    fantasy_league = create(:fantasy_league)
    fantasy_team = create(:fantasy_team, name: "Brown", 
                          fantasy_league: fantasy_league)
    fantasy_player = create(:fantasy_player, name: "Seattle Seahawks")
    create(:final_ranking, :finished_first, winnings: 25, 
           fantasy_player: fantasy_player)
    create(:roster_position,
           fantasy_player: fantasy_player, fantasy_team: fantasy_team)
    
    visit root_path
    click_on "Brown"

    expect(page).to have_content "Brown"
    expect(page).to have_content "Seattle Seahawks"
    expect(page).to have_content 25
  end
end
