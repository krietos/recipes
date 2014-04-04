class Tag < ActiveRecord::Base
  has_many :recipe_tags
  validates :name, :presence => true
  has_many :recipes, :through => :recipe_tags
end
