class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_id: @recipe.id)
    @recipe.ingredients.build(recipe_id: @recipe.id)
  end

  def create
    Recipe.create(recipe_params)
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name, 
        :quantity,
        :recipe_id
      ]
    )
  end

end
