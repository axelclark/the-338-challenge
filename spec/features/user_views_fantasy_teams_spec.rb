require "rails_helper"

feature "user views fantasy teams" do
  scenario "and sees relevant details on the page" do
    fantasy_team = create(:fantasy_team, name: "Brown")
    
    visit root_path
    click_on "Fantasy Teams"

    expect(page).to have_css "a", text: "Brown"
  end
end
