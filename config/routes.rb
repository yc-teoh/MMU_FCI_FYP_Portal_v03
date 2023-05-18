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
  get "/projects/:project_id/edit_details", to: "projects#edit_details", as: :edit_details
  get "/projects/:project_id/edit_industry_collab", to: "projects#edit_industry_collab", as: :edit_industry_collab

  get "/usermgmt", to: "users#index"
  get "/usermgmt/:user_id", to: "users#show"
  get "/usermgmt/:user_id/edit", to: "users#edit"
  get "/usermgmt/:user_id/edit_stud_spec_batch", to: "users#edit_stud_spec_batch", as: :edit_stud_spec_batch
  get "/usermgmt/:user_id/edit_stud_status", to: "users#edit_stud_status", as: :edit_stud_status
  get "/usermgmt/:user_id/edit_moderator_assign", to: "users#edit_moderator_assign", as: :edit_moderator_assign
  get "/usermgmt/:user_id/edit_supervisor_assign", to: "users#edit_supervisor_assign", as: :edit_supervisor_assign

  get "/batchmgmt", to: "batches#index"
  get "/batchmgmt/new", to: "batches#new"
  get "/batchmgmt/:batch_id", to: "batches#show"
  get "/batchmgmt/:batch_id/edit", to: "batches#edit"

  resources :announcements, param: :announcement_id
  resources :projects, param: :project_id
  resources :users, param: :user_id
  resources :batches, param: :batch_id

end
