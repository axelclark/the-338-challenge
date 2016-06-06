require "administrate/base_dashboard"

class TransactionLineItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    roster_transaction: Field::BelongsTo,
    fantasy_team: Field::BelongsTo,
    fantasy_player: Field::BelongsTo,
    id: Field::Number,
    action: Field::Select.with_options(
      collection: TransactionLineItem.action_list),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :roster_transaction,
    :fantasy_team,
    :fantasy_player,
    :action,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :roster_transaction,
    :fantasy_team,
    :fantasy_player,
    :id,
    :action,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :roster_transaction,
    :fantasy_team,
    :fantasy_player,
    :action,
  ].freeze

  # Overwrite this method to customize how transaction line items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(transaction_line_item)
  #   "TransactionLineItem ##{transaction_line_item.id}"
  # end
end
