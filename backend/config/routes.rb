Rails.application.routes.draw do
  devise_for :users, path: "api/v1/users/", controllers: {
    registrations: "api/v1/registrations",
    sessions: "api/v1/sessions",
  }

  namespace :api do
    namespace :v1 do
      resources :dashboards, only: [:index]
    end
  end
end
