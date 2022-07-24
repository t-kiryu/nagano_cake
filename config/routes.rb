Rails.application.routes.draw do

  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres,    only: [:index, :create, :edit, :update, :destroy]
    resources :items,     only: [:new, :index, :create, :show, :edit, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
