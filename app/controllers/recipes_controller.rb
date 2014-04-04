class RecipesController < ApplicationController
  def index
    @recipe = Recipe.new
    if params[:sort] == 'rating'
      @recipes = Recipe.sort_ratings
    elsif params[:sort] == 'name'
      @recipes = Recipe.sort_name
    elsif params[:sort] == 'featured'
      @recipes = Recipe.sort_featured
    elsif params[:sort] == 'new'
      @recipes = Recipe.sort_new
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('show.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipes = Recipe.all
    if @recipe.save
      redirect_to('/recipes/')
    else
      render('index.html.erb')
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect_to("/recipes/#{@recipe.id}")
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to("/recipes/")
  end
end
