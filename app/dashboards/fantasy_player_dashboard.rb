require "administrate/base_dashboard"

class FantasyPlayerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sports_league: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    final_rankings: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    final_rankings: Field::NestedHasMany.
                     with_options(skip: :fantasy_player),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :sports_league,
    :final_rankings,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :sports_league,
    :final_rankings,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :sports_league,
    :final_rankings,
  ].freeze

  # Overwrite this method to customize how fantasy players are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(fantasy_player)
    "#{fantasy_player.name}"
  end
end
