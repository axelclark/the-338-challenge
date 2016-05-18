class RosterTransactionsController < ApplicationController
  def index 
    @roster_transactions = RosterTransaction.all
  end
end
