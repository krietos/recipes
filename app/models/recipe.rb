class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  has_many :tags, :through => :recipe_tags
end
