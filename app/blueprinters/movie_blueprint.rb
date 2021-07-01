class MovieBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :imdb_id
  field :starts, name: :starts_formatted, datetime_format: "%^A, %^b %e, %Y |%l%p %Z"
  field :ends, name: :ends_formatted, datetime_format: "%^A, %^b %e, %Y |%l%p %Z"

  view :extended do
    fields :price, :currency
  end

  view :include_ratings do
    include_view :extended
    association :ratings, blueprints: RatingBluePrint, view :extended
  end
end
