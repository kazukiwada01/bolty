Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root "homes#index"
  get "partners/new"
  post "partners/confirm"
  post "partners/back"
  post "partners/done"
  resources :admins, only: [:show, :edit, :update]
  resources :gyms, only: [:new, :create, :edit, :update, :destroy] do
    resources :problem_lists, only: [:index, :new, :create, :edit, :update] do
      resources :problems, only: [:index, :create]
    end
  end
end
