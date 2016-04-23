require "rails_helper"

feature "admin visits admin dashboard" do
  scenario "and updates fantasy player ranking" do
    fantasy_player = create(:fantasy_player)

    visit root_path
    click_on "Admin"
    click_on "Fantasy Players"
    click_on "Edit"
    fill_in "Final ranking", with: 1
    click_on "Update Fantasy player"

    expect(page).to have_css(".flash", 
      text: "FantasyPlayer was successfully updated.")
  end

  scenario "and updates sports league trade deadline" do
    fantasy_player = create(:sports_league)

    visit root_path
    click_on "Admin"
    click_on "Sports Leagues"
    click_on "Edit"
    fill_in "Trade deadline", with: "2016-11-22" 
    click_on "Update Sports league"

    expect(page).to have_css(".flash", 
      text: "SportsLeague was successfully updated.")
  end


end
