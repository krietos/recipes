class Recipe < ActiveRecord::Base
  has_many :recipe_tags
  has_many :tags, :through => :recipe_tags
  has_many :ratings
  validates :name, :presence => true

  def self.sort_ratings
    sorted_array = []
    return_array = []
    Recipe.all.each do |recipe|
      sorted_array << [recipe, recipe.ave_rating]
    end
    sorted_array.sort{ |a, b| b[1] <=> a[1] }.each do |recipe_rating|
      return_array << recipe_rating[0]
    end
    return_array

  end

  def self.sort_name
    Recipe.all.order("name")
  end

  def self.sort_new
    Recipe.all.order("updated_at").reverse_order
  end

  def self.sort_featured
    sorted_array = []
    return_array = []
    Recipe.all.each do |recipe|
      seconds = Time.now - recipe.created_at
      new_rating = recipe.ave_rating - (seconds/10000)
      sorted_array << [recipe, new_rating]
    end
    sorted_array.sort{ |a, b| b[1] <=> a[1] }.each do |recipe_rating|
      return_array << recipe_rating[0]
    end
    return_array

  end

  def ave_rating
    sum = 0
    if self.ratings.length == 0
      return 0
    else
      self.ratings.each do |rating|
        sum += rating.rating
      end
      (sum.to_f / self.ratings.length.to_f).round(1)
    end
  end

end
