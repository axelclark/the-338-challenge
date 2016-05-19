class CreateTransactionLineItemDetails < ActiveRecord::Migration
  def change
    create_view :transaction_line_item_details
  end
end
