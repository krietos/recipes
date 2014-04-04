class RatingsController < ApplicationController

  def create
    @rating = Rating.create(params[:recipe_rating])
    redirect_to("/recipes/#{@rating.recipe_id}")
    flash[:notice] = "Rating added!"
  end
end
