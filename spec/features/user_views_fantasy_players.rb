require "rails_helper"

feature "user views fantasy players" do
  scenario "and sees relevant details on the page" do
    nfl = create(:sports_league)
    
    visit sports_leagues_path
    click_on nfl.name

    expect(page).to have_content "Seattle Seahawks"
  end
end
