Rails.application.routes.draw do
  devise_for :users
  root 'lessons#index'

    resources :lessons, only: [:index, :show] 


  namespace :admin do
    resources :lessons
    resources :teachers

  get 'welcome/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
