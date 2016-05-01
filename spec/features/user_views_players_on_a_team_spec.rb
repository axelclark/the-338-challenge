require "rails_helper"

feature "user visits a fantasy team page" do
  scenario "and sees a listing of fantasy players on the page" do
    fantasy_player = create(:fantasy_player, name: "Seattle Seahawks")
    fantasy_team = create(:fantasy_team, name: "Brown")
    create(:roster_position,
           fantasy_player: fantasy_player, fantasy_team: fantasy_team)


    visit fantasy_teams_path
    click_on "Brown"

    expect(page).to have_content "Seattle Seahawks"
  end
end
