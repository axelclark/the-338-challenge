require "rails_helper"

feature "user visits a fantasy team page" do
  scenario "and sees a listing of fantasy players on the page" do
    create(:roster_position)

    visit fantasy_teams_path
    click_on "Brown"

    expect(page).to have_content "Seattle Seahawks"
  end
end
