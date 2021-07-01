class RatingBlueprint < Blueprinter::Base
  identifier :id

  field :stars

  view :extended do
    field :comment
  end
end
