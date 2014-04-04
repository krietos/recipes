require 'spec_helper'

describe RecipeTag do
  it 'should validate uniqueness of recipe id and tag id pair' do
    test_tag = Tag.create(:name => 'tag')
    test_recipe = Recipe.create(:name => 'recipe')
    test_recipe2 = Recipe.create(:name => 'recipe')
    recipe_tag = RecipeTag.create(:recipe_id => test_recipe.id, :tag_id => test_tag.id)
    recipe_tag2 = RecipeTag.create(:recipe_id => test_recipe.id, :tag_id => test_tag.id)
    recipe_tag2 = RecipeTag.create(:recipe_id => test_recipe2.id, :tag_id => test_tag.id)
    RecipeTag.all.length.should eq 2
  end
end

