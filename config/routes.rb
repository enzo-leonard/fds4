Rails.application.routes.draw do
  resources :projet_themes
  resources :projet_forms
  resources :projet_targets
  resources :projets
  resources :forms
  resources :themes
  resources :targets
  devise_for :users
  get "home", to: "pages#home"
  get "quizz", to: "pages#quizz"
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
