Rails.application.routes.draw do
  get 'status/create'
  get 'statuses/create'
  get 'todos/:id', to: 'todos#show', as: 'todo'
  resources :todos, only: :index do
    resources :statuses, only: [:create, :edit, :update]
  end
  resources :statuses, only: :index
  get 'statuses/:id/complete', to: 'statuses#complete', as: 'complete'

  root to: 'todos#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
