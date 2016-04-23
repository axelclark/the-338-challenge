require "administrate/base_dashboard"

class SportsLeagueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    fantasy_players: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    waiver_deadline: Field::DateTime,
    trade_deadline: Field::DateTime,
    championship_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :championship_date,
    :fantasy_players,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :waiver_deadline,
    :trade_deadline,
    :championship_date,
    :fantasy_players,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :waiver_deadline,
    :trade_deadline,
    :championship_date,
    :fantasy_players,
  ].freeze

  # Overwrite this method to customize how sports leagues are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(sports_league)
    "#{sports_league.name}"
  end
end
