Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' },
             path: '', path_names: { sign_in: 'login', sign_up: 'signup', sign_out: 'logout' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "articles#index"
  root to: "home#index"

  get "/announcements", to: "announcements#index"
  get "/announcements/:announcement_id", to: "announcements#show"
end
