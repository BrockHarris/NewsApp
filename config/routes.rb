NewsApp::Application.routes.draw do
  
  resources :users
  resources :bookmarks
  resources :pages
  
  root :to => 'pages#home'

end
