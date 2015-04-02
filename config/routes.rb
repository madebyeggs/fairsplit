V1::Application.routes.draw do
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_splitter' }

  root :to => 'home#index'
  
  match 'artists/artist_show_via_ajax_call' => 'artists#artist_show_via_ajax_call'
  match 'works/work_show_via_ajax_call' => 'works#work_show_via_ajax_call'
  
  resources :cms
  resources :works
  resources :announcements
  resources :artists
  resources :homes
  resources :sounds
  
end