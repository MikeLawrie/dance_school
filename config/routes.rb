Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

    resources :lessons, only: [:index] 


  namespace :admin do
    resources :lessons
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
