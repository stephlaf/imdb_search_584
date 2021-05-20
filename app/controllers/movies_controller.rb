class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # USING ActiveRecord with a bit of SQL

      # @movies = Movie.where(title: params[:query])

      # sql_query = "\
      #   movies.title @@ :query\
      #   OR movies.synopsis @@ :query\
      #   OR directors.first_name @@ :query\
      #   OR directors.last_name @@ :query\
      # "

      # @movies = Movie.joins(:director).where(sql_query,  query: "%#{params[:query]}%")


      # USING PG:Search
      # @movies = Movie.global_search(params[:query])
      
      # USING PG:Search:multisearch (Movie && TvShows)
      # @movies = PgSearch.multisearch(params[:query])

      # USING ElasticSearch
      @movies = Movie.search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
