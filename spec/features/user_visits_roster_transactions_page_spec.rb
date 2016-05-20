require "rails_helper"

feature "user visits roster transactions page" do
  scenario "and views a list of waiver claims in a league" do
    fantasy_league = create(:fantasy_league, id: 1)
    fantasy_team = create(:fantasy_team, fantasy_league: fantasy_league) 
    add_fantasy_player = create(:fantasy_player) 
    drop_fantasy_player = create(:fantasy_player) 
    transaction = create(:roster_transaction,
                         roster_transaction_type: "waiver claim") 
    create(:transaction_line_item, fantasy_team: fantasy_team, 
      fantasy_player: drop_fantasy_player, action: "drops",
      roster_transaction: transaction)
    create(:transaction_line_item, fantasy_team: fantasy_team, 
      fantasy_player: add_fantasy_player, action: "adds",
      roster_transaction: transaction)

    visit roster_transactions_path

    expect(page).to have_content fantasy_team.name
    expect(page).to have_content add_fantasy_player.name 
    expect(page).to have_content drop_fantasy_player.name 
  end
end
