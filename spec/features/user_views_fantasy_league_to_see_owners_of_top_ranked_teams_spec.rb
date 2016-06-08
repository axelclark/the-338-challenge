require "rails_helper"

feature "user views fantasy league to see owners of top ranked teams" do
  scenario "and see all players ranked first or second" do
    fantasy_league = create(:fantasy_league)
    fantasy_player = create(:fantasy_player, name: "Seattle Seahawks")
    unowned_fantasy_player = create(:fantasy_player, name: "Oakland Raiders")
    create(:final_ranking, :finished_first, fantasy_player: fantasy_player)
    create(:final_ranking, rank: 2, fantasy_player: unowned_fantasy_player)
    fantasy_team = create(:fantasy_team, name: "Brown",
                                         fantasy_league: fantasy_league)
    create(:roster_position, fantasy_team: fantasy_team,
                             fantasy_player: fantasy_player)

    visit fantasy_league_path(fantasy_league)

    expect(page).to have_content fantasy_team.name
    expect(page).to have_content fantasy_player.name
    expect(page).to have_content unowned_fantasy_player.name
  end
end
