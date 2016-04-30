class UpdateDetailsInFinalRankings < ActiveRecord::Migration
  def self.up
    change_column :final_rankings, :winnings, :integer
  end
  
  def self.down
    change_column :final_rankings, :winnings, :decimal
  end
end
