Rails.application.routes.draw do
  devise_for :administrators, controllers: { sessions: 'admins/sessions' }, only: %i[sessions]
  namespace :admins do
    root 'home#index'
  end
end
