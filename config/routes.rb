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

  get "/projects", to: "projects#index"
  get "/projects/new", to: "projects#new"
  get "/projects/:project_id", to: "projects#show"
  get "/projects/:project_id/edit", to: "projects#edit"
  get "/projects/:project_id/edit_review", to: "projects#edit_review", as: :edit_review
  get "/projects/:project_id/edit_personnel", to: "projects#edit_personnel", as: :edit_personnel

  get "/usermgmt", to: "users#index"
  get "/usermgmt/:user_id", to: "users#show"

  resources :announcements, param: :announcement_id
  resources :projects, param: :project_id
  resources :users, param: :user_id

end
