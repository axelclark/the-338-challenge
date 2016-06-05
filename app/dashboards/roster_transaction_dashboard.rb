require "administrate/base_dashboard"

class RosterTransactionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    fantasy_players: Field::HasMany,
    fantasy_teams: Field::HasMany,
    transaction_line_items: Field::HasMany,
    id: Field::Number,
    roster_transaction_type: Field::Select.with_options(
      collection: RosterTransaction.roster_transaction_types.keys),
    additional_terms: Field::Text,
    roster_transaction_on: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :roster_transaction_type,
    :roster_transaction_on,
    :transaction_line_items,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :roster_transaction_on,
    :roster_transaction_type,
    :transaction_line_items,
    :additional_terms,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :roster_transaction_type,
    :roster_transaction_on,
    :additional_terms,
  ].freeze

  # Overwrite this method to customize how roster transactions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(roster_transaction)
  #   "RosterTransaction ##{roster_transaction.id}"
  # end
end
