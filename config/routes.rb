Rails.application.routes.draw do

  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  get 'oauths/oauth'

  get 'oauths/callback'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
# ==============================================================================================
# Static Pages
# ==============================================================================================

root to: "pages#index"

get 'user_profile/verification' => 'user_profiles#verification'
post 'user_profile/verification' => 'user_profiles#check_pin_code'

# ==============================================================================================
# Resource
# ==============================================================================================

resources :users, only: [:new, :create, :show, :index, :edit, :update] 

resources :user_profiles, only: [:new, :create, :edit, :update]

resources :agent_profiles, only: [:new, :create, :edit, :update]

resources :requests, only: [:new, :create, :edit, :update, :index]

resources :password_resets

# ==============================================================================================
# User Sessions/Login/Logout
# ==============================================================================================

resources :user_sessions, only: [:new, :create]

get :login, to: 'user_sessions#new'
delete :logout, to: 'user_sessions#destroy'


# ==============================================================================================
# API for Ionic App
# ==============================================================================================

namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :index, :update]
      resources :user_sessions, only: [:create]
      resources :agent_profile, only: [:create]

      post '/agent_profile/send_pin_code' => 'agent_profile#send_pin_code'
      post '/agent_profile/verify_pin_code' => 'agent_profile#verify_pin_code'
      post '/agent_profile/upload_photo' => 'agent_profile#upload_photo'
      patch '/agent_profile/update_profile' => 'agent_profile#update_profile'
    end
end



post "oauth/callback" => "oauths#callback"
get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end
