require "administrate/base_dashboard"

class FinalRankingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    fantasy_player: Field::BelongsTo,
    id: Field::Number,
    year: Field::Number,
    rank: Field::Number,
    points: Field::Number,
    winnings: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :fantasy_player,
    :year,
    :rank,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :fantasy_player,
    :year,
    :rank,
    :points,
    :winnings,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :fantasy_player,
    :year,
    :rank,
    :points,
    :winnings,
  ].freeze

  # Overwrite this method to customize how final rankings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(final_ranking)
  #   "FinalRanking ##{final_ranking.id}"
  # end
end
