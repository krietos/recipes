class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :string
      t.column :rating, :int
      t.timestamps
    end
    create_table :tags do |t|
      t.column :name, :string
    end
    create_table :recipe_tags do |t|
      t.column :tag_id, :int
      t.column :recipe_id, :int
    end
    create_table :ingredients do |t|
      t.column :name, :string
    end
    create_table :ingredient_recipes do |t|
      t.column :recipe_id, :int
      t.column :ingredient_id , :int
    end
  end
end
