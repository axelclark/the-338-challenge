require "rails_helper"

feature "user views sports leagues" do
  scenario "and sees relevant details on the page" do
    fantasy_team = create(:fantasy_team)
    
    visit fantasy_teams_path

    expect(page).to have_content "Brown"
  end
end
