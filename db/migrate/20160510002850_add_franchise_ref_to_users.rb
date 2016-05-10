class AddFranchiseRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :franchise, index: true, foreign_key: true
  end
end
