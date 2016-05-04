require "rails_helper"

feature "user visits home page" do
  scenario "and sees both division's standings" do
    fantasy_league_a = create(:fantasy_league, year: 2016, division: "A")
    fantasy_league_b = create(:fantasy_league, year: 2016, division: "B")
    fantasy_team = create(:fantasy_team, name: "Brown",
                          fantasy_league: fantasy_league_a)
    other_fantasy_team = create(:fantasy_team, name: "Axel",
                          fantasy_league: fantasy_league_a)

    visit root_path

    expect(page).to have_content "2016 Division A"
    expect(page).to have_content "Brown"
    expect(page).to have_content "2016 Division B"
    expect(page).to have_content "Axel"
  end
end
