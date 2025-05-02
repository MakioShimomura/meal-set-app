Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                               only: %i[registrations sessions]
  devise_for :administrators, controllers: { sessions: 'admins/sessions' }, only: %i[sessions]
  namespace :admins do
    root 'home#index'
  end
  root 'home#index'
end
