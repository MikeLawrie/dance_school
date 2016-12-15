Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  
  resources :lessons, only: [:index, :show] do
    get :sign, on: :member
    patch :sign_done, on: :member
    delete :sign_out_done, on: :member
    get :my, on: :collection
    get :past, on: :collection
  end
  resources :teachers
  resources :groups
  get 'welcome/index'

  namespace :admin do
    resources :lessons  do
      get :sign, on: :member
      patch :sign_done, on: :member
      delete :sign_out_done, on: :member
      patch :student_present, on: :member
      delete :student_not_present, on: :member
    end
    resources :teachers
    resources :groups
    resources :students
  get 'welcome/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
