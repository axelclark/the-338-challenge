require "rails_helper"

feature "user views home page" do
  scenario "and visits about page" do
    visit root_path
    click_on "About"

    expect(page).to have_content "About"
  end
end
