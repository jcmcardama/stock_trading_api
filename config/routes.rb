Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get "/home", to: "pages#home"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
