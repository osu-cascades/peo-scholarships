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

  resources :scholarships

  namespace :admin do
    resources :scholarships do
      resources :applications, except: [:new, :create, :edit]
      resources :questions, except: :show
    end
  end

end
