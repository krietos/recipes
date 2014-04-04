Recipes::Application.routes.draw do
  match('recipes/', { :via => :get, :to => 'recipes#index' })
  match('recipes/sort/:sort', { :via => :get, :to => 'recipes#index' })
  match('recipes/:id', {:via => :get, :to => 'recipes#show'})
  match('recipes', {:via => :post, :to => 'recipes#create'})
  match('recipes/:id/edit', {:via => :get, :to => 'recipes#edit'})
  match('recipes/:id', {:via => [:patch, :put], :to => 'recipes#update'})
  match('recipes/:id', {:via => :delete, :to => 'recipes#destroy'})

  match('ratings/:id', {:via => :post, :to => 'ratings#create'})

  match('recipes/tags', {:via => :post, :to => 'recipe_tags#create'})
  match('recipes/tags/:id', {:via => :delete, :to => 'recipe_tags#destroy'})


  match('tags', { :via => :get, :to => 'tags#index' })
  match('tags/:id', {:via => :get, :to => 'tags#show'})
  match('tags', {:via => :post, :to => 'tags#create'})
  match('tags/:id/edit', {:via => :get, :to => 'tags#edit'})
  match('tags/:id', {:via => [:patch, :put], :to => 'tags#update'})
  match('tags/:id', {:via => :delete, :to => 'tags#destroy'})
end
