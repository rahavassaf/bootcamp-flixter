Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  namespace :instructor do
    resources :lessons, only: [:update]
  	resources :sections, only: [:update] do
  		resources :lessons, only: [:new, :create]
  	end

    resources :courses, only: [:new, :create, :show] do
    	resources :sections, only: [:new, :create]
    end
  end

  resources :courses, only: [:index, :show] do
    resources :enrollments, only: [:create]
  end

  resources :enrollments, only: [:destroy]
  resources :lessons, only: [:show]
end
