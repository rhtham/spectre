Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/' => redirect('/projects')

  resources :projects, param: :slug, only: [:index] do
    resources :suites, param: :slug, only: [:show] do
      resources :runs, param: :sequential_id, only: [:show]
    end
  end

  resources :runs, only: [:new, :create]
  resources :tests, only: [:update, :new, :create]

  get '/baselines/:key', to: 'baselines#show', as: :baseline

  # Remove or comment out this line if it exists:
  # Rails.application.routes.draw do
  #   active_storage_direct_uploads
  # end
end
