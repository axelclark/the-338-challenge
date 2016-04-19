require "rails_helper"

feature "user views fantasy players" do
  scenario "and sees relevant details on the page" do
#    sports_league = create(:sports_league)
    fantasy_player = create(:fantasy_player)
#    sports_league.fantasy_players << fantasy_player

    visit sports_leagues_path
    click_on sports_league.name

#    expect(page).to have_content fantasy_player.name
  end
end
