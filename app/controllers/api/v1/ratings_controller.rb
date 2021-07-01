class Api::V1::RatingsController < ApplicationController
  before_action :movie
  before_action :ratings, only: :index

  def index
    json_response(RatingBlueprint.render(@ratings, view: :extended))
  end

  def create
    rating = @movie.ratings.new(rating_params)

    if rating.save
      json_response(RatingBlueprint.render(rating, view: :extended), :created)
    else
      json_response({ errors: rating.errors.full_messages, error_code: "rating_creation_failed" }, :bad_request)
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :comment)
  end

  def ratings
    @ratings = @movie.ratings
  end

  def movie
    return if @movie = Movie.find_by(id: params[:movie_id])

    json_response({ error: "Movie could not be found.", error_code: "not_found" }, :not_found)
  end
end
