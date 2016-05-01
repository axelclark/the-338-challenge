require "rails_helper"

feature "user views sports leagues" do
  scenario "and sees relevant details on the page" do
    nfl = create(:sports_league, name: "NFL", championship_date: "2017-02-01")
    
    visit sports_leagues_path

    expect(page).to have_content "NFL"
    expect(page).to have_content "February 1"
  end
end
