Rails.application.routes.draw do

  root 'static_pages#home'

  # Users
  # Using Devise RegistrationsController for public user creation/registration.
  devise_for :users, controllers: { registrations: 'registrations' }
  # Using UsersController and /users/* paths for profile viewing and editing.
  resources :users, only: [:show, :edit, :update]
  # Namespacing to the '/admin/users' path, to avoid conflicting with Devise.
  scope 'admin' do
    resources :users, only: [:index, :new, :create, :destroy]
  end

  resources :scholarships, only: :index do
    resources :applications, except: [:index] do
      # # See issue 43
      # get 'recommendation-letter', on: :member
      patch 'submit', on: :member
      resources :transcripts, only: [:destroy]
    end
  end

  namespace :admin do
    resources :scholarships do
      patch 'publish', on: :member
      patch 'unpublish', on: :member
      resources :applications, except: [:create, :edit]
      resources :questions, except: [:index, :show]
    end
  end

  namespace :member do
    resources :scholarships, only: :index do
      resources :applications, only: [:index, :show, :update]
    end
  end

end
