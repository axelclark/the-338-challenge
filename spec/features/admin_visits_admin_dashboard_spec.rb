require "rails_helper"

feature "admin visits admin dashboard" do
  scenario "and updates fantasy player name" do
    fantasy_player = create(:fantasy_player)

    visit_admin_to_edit "Fantasy Players"
    fill_in "Name", with: "LA Seahawks"
    click_on "Update Fantasy player"

    expect(page).to have_css(".flash", 
      text: "FantasyPlayer was successfully updated.")
  end

  scenario "and updates sports league trade deadline" do
    fantasy_player = create(:sports_league)

    visit_admin_to_edit "Sports Leagues"
    fill_in "Trade deadline", with: "2016-11-22" 
    click_on "Update Sports league"

    expect(page).to have_css(".flash", 
      text: "SportsLeague was successfully updated.")
  end

  scenario "and creates final ranking for fantasy player" do
    fantasy_player = create(:fantasy_player)

    visit admin_final_rankings_path
    click_on "New final ranking"
    select "Seattle Seahawks", from: "Fantasy player"
    fill_in "Year", with: 2016 
    fill_in "Rank", with: 1 
    click_on "Create Final ranking"

    expect(page).to have_css(".flash", 
      text: "FinalRanking was successfully created.")
  end

  scenario "and adds fantasy player to fantasy team" do
    create(:fantasy_player)
    create(:fantasy_team)

    visit admin_roster_positions_path
    click_on "New roster position"
    select "Seattle Seahawks", from: "Fantasy player"
    select "Brown", from: "Fantasy team"
    click_on "Create Roster position"

    expect(page).to have_css(".flash",
      text: "RosterPosition was successfully created.")
  end

  def visit_admin_to_edit(model)
    visit root_path
    click_on "Admin"
    click_on model 
    click_on "Edit" 
  end
end
