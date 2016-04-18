require "rails_helper"

feature "user views sports leagues" do
  scenario "and sees relevant details on the page" do
    nfl = create(:sports_league)
    
    visit sports_leagues_path

    expect(page).to have_content "NFL"
    expect(page).to have_content "2017-02-01"
  end
end
