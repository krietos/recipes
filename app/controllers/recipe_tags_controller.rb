class RecipeTagsController < ApplicationController
  def create
    @recipe_tag = RecipeTag.new(params[:recipe_tag])
    if @recipe_tag.save
      redirect_to("/recipes/#{@recipe_tag.recipe_id}")
      flash[:notice] = "Tag added!"
    else
      redirect_to("/recipes/#{@recipe_tag.recipe_id}")
      flash[:notice] = "You cannot add the same tag!"
    end
  end

  def destroy
    @recipe_tag = RecipeTag.find(params[:id])
    @id = @recipe_tag.recipe_id
    @recipe_tag.destroy
    redirect_to("/recipes/#{@id}")
  end

end
