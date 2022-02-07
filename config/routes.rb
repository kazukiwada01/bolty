Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  get "partners/new"
  post "partners/confirm"
  post "partners/back"
  post "partners/done"
end
