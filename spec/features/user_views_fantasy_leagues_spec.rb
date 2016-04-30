require "rails_helper"

feature "user visits home page" do
  scenario "and sees Division A standings" do
    fantasy_league = create(:fantasy_league)
    
    visit root_path

    expect(page).to have_content "2016 Division A"
  end
end
