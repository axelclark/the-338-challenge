require "rails_helper"

feature "user visits admin dashboard" do
  scenario "and receives a 404 response" do
    create_user "user@example.com", "password"
    sign_in_with "user@example.com", "password"
    
    expect { visit admin_root_path }.
      to raise_error(ActionController::RoutingError)
  end
 
  private

  def create_user(email, password)
    create(:user, email: email, password: password)
  end
end
