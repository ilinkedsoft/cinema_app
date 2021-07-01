class Api::V1::MoviesController < ApplicationController
  before_action :movies, only: :index
  before_action :movie, only: :show

  def index
    render json: MovieBlueprint.render(@movies), status: :ok
  end

  def show
    render json: MovieBlueprint.render(@movie, view: :include_ratings), status: :ok
  end

  private

  def movies
    @movies = Movie.all
  end

  def movie
    return if @movie = Movie.find_by(id: params[:id])

    render json: { error: "Movie could not be found.", error_code: "not_found" }, status: :bad_request
  end
end
