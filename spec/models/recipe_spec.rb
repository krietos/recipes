require 'spec_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should have_many :tags }
  it { should have_many :ratings }

  context '.sort_ratings' do
    it 'will return an array with all recipes sorted from best to worst ratings' do
      test_recipe2 = Recipe.create(:name => 'recipe')
      test_recipe = Recipe.create(:name => 'recipe')
      test_rating1 = Rating.create(:rating => 1, :recipe_id => test_recipe.id)
      test_rating2 = Rating.create(:rating => 5, :recipe_id => test_recipe.id)
      test_rating3 = Rating.create(:rating => 4, :recipe_id => test_recipe2.id)
      test_rating4 = Rating.create(:rating => 5, :recipe_id => test_recipe2.id)
      Recipe.sort_ratings.should eq [test_recipe2, test_recipe]
    end
  end

  context '#ave_rating' do
    it 'returns the average rating of a recipe' do
      test_recipe = Recipe.create(:name => 'recipe')
      test_rating1 = Rating.create(:rating => 1, :recipe_id => test_recipe.id)
      test_rating2 = Rating.create(:rating => 5, :recipe_id => test_recipe.id)
      test_rating3 = Rating.create(:rating => 3, :recipe_id => test_recipe.id)
      test_recipe.ave_rating.should eq 3
    end
  end
end


