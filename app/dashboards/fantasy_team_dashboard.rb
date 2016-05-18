require "administrate/base_dashboard"

class FantasyTeamDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    roster_positions: Field::HasMany,
    fantasy_players: Field::HasMany,
    fantasy_league: Field::BelongsTo,
    franchise: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    waiver_position: Field::Number,
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
    :franchise,
    :fantasy_players,
    :fantasy_league,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :waiver_position,
    :franchise,
    :fantasy_league,
    :fantasy_players,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :waiver_position,
    :franchise,
    :fantasy_league,
  ].freeze

  # Overwrite this method to customize how fantasy teams are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(fantasy_team)
    "#{fantasy_team.name}"
  end
end
