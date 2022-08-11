Rails.application.routes.draw do

  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  scope module: :public do
    root to: 'items#top'
    get   'about' => 'items#about'
    get    'customers/my_page'         => 'customers#show'
    get    'customers/infomation/edit' => 'customers#edit'
    patch  'customers/infomation'      => 'customers#update'
    get    'customers/unsubscribe'     => 'customers#unsubscribe'
    patch  'customers/withdrawal'      => 'customers#withdrawal'
    resources :addresses,  only: [:new, :index, :create, :edit, :update, :destroy]
    resources :items,      only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete    'cart_items/destroy_all' => 'cart_items#destroy_all'
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
