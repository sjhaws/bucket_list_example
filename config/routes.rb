Rails.application.routes.draw do
  root 'lists#index'

  resources :lists do 
    resources :activities
    resources :destinations, except: :index
  end

  scope 'activities/:activity_id', as: 'activity' do
    resources :notes, only: [:create, :update, :destroy, :new, :edit]
  end
end
