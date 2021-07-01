class Api::V1::MoviesController < ApplicationController
  before_action :movies, only: :index
  before_action :movie, only: %i[show details]

  def index
    json_response(MovieBlueprint.render(@movies))
  end

  def show
    json_response(MovieBlueprint.render(@movie, view: :include_ratings))
  end

  def details
    response = Faraday.get "http://www.omdbapi.com/?apikey=#{Rails.application.credentials.imdb[:api_key]}&i=#{@movie.imdb_id}"
    json_response(JSON.parse(response.body), response.status)
  end

  private

  def movies
    @movies = Movie.all
  end

  def movie
    return if @movie = Movie.find_by(id: params[:id])

    json_response({ error: 'Movie could not be found.', error_code: 'not_found' }, :not_found)
  end
end
