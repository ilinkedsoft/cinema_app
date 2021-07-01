class MovieBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :imdb_id, :price, :currency
  field :starts, name: :starts_formatted, datetime_format: '%^A, %^b %e, %Y |%l%p %Z'
  field :ends, name: :ends_formatted, datetime_format: '%^A, %^b %e, %Y |%l%p %Z'

  view :include_ratings do
    association :ratings, blueprint: RatingBlueprint, view: :extended
  end
end
