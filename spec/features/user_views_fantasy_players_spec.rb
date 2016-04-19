require "rails_helper"

feature "user views fantasy players" do
  scenario "and sees relevant details on the page" do
    create(:fantasy_player) 

    visit sports_leagues_path
    click_on "NFL"

    expect(page).to have_content "Seattle Seahawks"
  end
end
