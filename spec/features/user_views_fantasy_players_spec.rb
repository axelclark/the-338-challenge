require "rails_helper"

feature "user views fantasy players" do
  scenario "and sees relevant details on the page" do
    sports_league = create(:sports_league, name: "NFL")
    fantasy_player = create(:fantasy_player, name: "Seattle Seahawks", 
           sports_league: sports_league)
    create(:final_ranking, :finished_first, fantasy_player: fantasy_player) 

    visit sports_leagues_path
    click_on "NFL"

    expect(page).to have_content "Seattle Seahawks"
    expect(page).to have_css(".ranking", text: "1")
  end
end
