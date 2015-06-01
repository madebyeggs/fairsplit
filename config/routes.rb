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
  
  get "/get_announcement_links" => "announcements#create_links", :as => :get_announcement_links
  get "/get_work_links" => "works#create_links", :as => :get_work_links
  get "/get_artist_links" => "artists#create_links", :as => :get_artist_links
  get "/get_sound_links" => "sounds#create_links", :as => :get_sound_links
  
  match '*path' => redirect('/')
  
end