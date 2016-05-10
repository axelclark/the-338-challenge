require "rails_helper"

feature "admin visits admin dashboard" do
  
  scenario "and updates fantasy player name" do
    create_admin
    fantasy_player = create(:fantasy_player)

    sign_in_with("admin@example.com", "password")
    visit_admin_to_edit "Fantasy Players"
    fill_in "Name", with: "LA Seahawks"
    click_on "Update Fantasy player"

    expect(page).to have_css(".flash", 
      text: "FantasyPlayer was successfully updated.")
  end

  scenario "and updates sports league trade deadline" do
    create_admin
    fantasy_player = create(:sports_league)

    sign_in_with("admin@example.com", "password")
    visit_admin_to_edit "Sports Leagues"
    fill_in "Trade deadline", with: "2016-11-22" 
    click_on "Update Sports league"

    expect(page).to have_css(".flash", 
      text: "SportsLeague was successfully updated.")
  end

  scenario "and creates final ranking for fantasy player" do
    create_admin 
    fantasy_player = create(:fantasy_player, name: "Seattle Seahawks")

    sign_in_with("admin@example.com", "password")
    visit admin_final_rankings_path
    click_on "New final ranking"
    select "Seattle Seahawks", from: "Fantasy player"
    fill_in "Year", with: 2016 
    fill_in "Rank", with: 1 
    fill_in "Points", with: 8
    fill_in "Winnings", with: 25
    click_on "Create Final ranking"

    expect(page).to have_css(".flash", 
      text: "FinalRanking was successfully created.")
  end

  scenario "and adds fantasy player to fantasy team" do
    create_admin
    create(:fantasy_player, name: "Seattle Seahawks")
    create(:fantasy_team, name: "Brown")

    sign_in_with("admin@example.com", "password")
    visit admin_roster_positions_path
    click_on "New roster position"
    select "Seattle Seahawks", from: "Fantasy player"
    select "Brown", from: "Fantasy team"
    click_on "Create Roster position"

    expect(page).to have_css(".flash",
      text: "RosterPosition was successfully created.")
  end

  scenario "and creates a fantasy league" do
    create_admin

    sign_in_with("admin@example.com", "password")
    visit admin_fantasy_leagues_path
    click_on "New fantasy league"
    fill_in "Year", with: 2016 
    fill_in "Division", with: "A" 
    click_on "Create Fantasy league"

    expect(page).to have_css(".flash", 
      text: "FantasyLeague was successfully created.")
  end
  
  scenario "and updates a user to an admin" do
    create_admin
    user = create(:user)

    sign_in_with("admin@example.com", "password")
    visit "/admin/users/#{user.id}"
    click_on "Edit"
    check "Admin"
    click_on "Update User"

    expect(page).to have_css(".flash", 
      text: "User was successfully updated.")
  end
  
  scenario "and updates a franchise name" do
    create_admin
    create(:franchise, name: "Swin/Mara")

    sign_in_with("admin@example.com", "password")
    visit_admin_to_edit("Franchises")
    fill_in "Name", with: "The Consortium" 
    click_on "Update Franchise"

    expect(page).to have_css(".flash", 
      text: "Franchise was successfully updated.")
  end
  
  def create_admin
    admin = create(:admin, email: "admin@example.com", password: "password")
  end

  def visit_admin_to_edit(model)
    visit root_path
    click_on "Admin"
    click_on model 
    click_on "Edit" 
  end
end
