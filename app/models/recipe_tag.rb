class RecipeTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :recipe
  validates :recipe_id, uniqueness: { scope: :tag_id}
end
