PhotoAlbum20130319::Application.routes.draw do
  root :to => 'welcome#index'

  resources :albums, :only => [:new, :create, :show, :filter] do
    member do
      get :filter
    end
  end

  resources :photos, :only => [:new, :create]
end
