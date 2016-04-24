require "rails_helper"

feature "user views fantasy players" do
  scenario "and sees relevant details on the page" do
    create(:final_ranking) 

    visit sports_leagues_path
    click_on "NFL"

    expect(page).to have_content "Seattle Seahawks"
    expect(page).to have_css(".ranking", text: "1")
  end
end
