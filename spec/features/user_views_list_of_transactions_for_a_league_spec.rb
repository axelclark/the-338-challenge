require "rails_helper"

feature "user visits transactions index" do
  scenario "and views a list of waiver claims in a league" do
    fantasy_league = create(:fantasy_league)
    fantasy_team = create(:fantasy_team, fantasy_league: fantasy_league) 
    add_fantasy_player = create(:fantasy_player) 
    drop_fantasy_player = create(:fantasy_player) 
    transaction = create(:roster_transaction, roster_transaction_type: "waiver") 
    create(:transaction_line_item, fantasy_team: fantasy_team, 
      fantasy_player: drop_fantasy_player, action: "drop",
      roster_transaction: transaction)
    create(:transaction_line_item, fantasy_team: fantasy_team, 
      fantasy_player: add_fantasy_player, action: "add",
      roster_transaction: transaction)

    visit roster_transactions_path

    expect(page).to have_content fantasy_team.name
    expect(page).to have_content fantasy_player.name 
  end
end
