Rails.application.routes.draw do

  get 'events/top'
  get 'events/detail' => 'events#detail'
  get 'events/new' => 'events#new'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :like_notes
    end
  end

  resources :notes, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :liking_users
    end
  end

  post '/like/:note_id' => 'likes#like', as: 'like'
  delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

  root 'toppage#index'
  get '/about' => 'home#about'
end
