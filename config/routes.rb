Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, :skip => [:registrations], :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' },
             path: '', path_names: { sign_in: 'login', sign_up: 'signup', sign_out: 'logout' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "articles#index"
  root to: "home#index"

  get "/announcements", to: "announcements#index"
  get "/announcements/new", to: "announcements#new"

  # These routes goes last whenever possible to avoid `new` controllers getting override.
  get "/announcements/:announcement_id", to: "announcements#show"
  get "/announcements/:announcement_id/edit", to: "announcements#edit"

  get "/usermgmt", to: "users#index"

  resources :announcements, param: :announcement_id

end
