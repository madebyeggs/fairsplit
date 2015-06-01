V1::Application.routes.draw do
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_splitter' }

  root :to => 'home#index'
  
  resources :cms
  resources :works
  resources :announcements
  resources :artists
  resources :homes
  resources :sounds
  resources :abouts
  
  match '*path' => redirect('/')
  get "/artist_links" => "artists#create_links", :as => :get_artist_links
  
end