class Api::V1::RatingsController < ApplicationController
  before_action :movie
  before_action :ratings, only: :index

  def index
    render json: RatingBlueprint.render(@ratings, view: :extended), status: :ok
  end

  def create
    rating = @movie.ratings.new(rating_params)

    if rating.save
      render json: RatingBlueprint.render(rating, view: :extended), status: :created
    else
      render json: { errors: rating.errors.full_messages, error_code: "rating_creation_failed" }, status: :bad_request
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

    render json: { error: "Movie could not be found.", error_code: "not_found" }, status: :bad_request
  end
end
