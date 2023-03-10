Rails.application.routes.draw do
  #get 'fidelity_card/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index new create]
  # Nested route below used in qr_code on restaurant show action
  resources :restaurants, only: %i[show] do
    resources :fidelity_cards, only: %i[create new]
  end
  resources :fidelity_card, only: %i[show]
  resources :dashboard, only: %i[index]

  # Defines the root path route ("/")
  # root "articles#index"
end
