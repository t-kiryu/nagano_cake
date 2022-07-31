Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get   'about' => 'homes#about'

    get   'customers/my_page'         => 'customers#show'
    get   'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation'      => 'customers#update'
    get   'customers/unsubscribe'     => 'customers#unsubscribe'

    get   'items'     => 'items#index'
    get   'items/:id' => 'items#show'

    resources :addresses, only: [:new, :index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items,     only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres,    only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:passwords], controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
