Rails.application.routes.draw do

  scope module: :public do
    root to: 'items#top'
    get    'about' => 'items#about'
    get    'customers/my_page'         => 'customers#show'
    get    'customers/infomation/edit' => 'customers#edit'
    patch  'customers/infomation'      => 'customers#update'
    get    'customers/unsubscribe'     => 'customers#unsubscribe'
    patch  'customers/withdrawal'      => 'customers#withdrawal'
    resources :addresses,  only: [:new, :index, :create, :edit, :update, :destroy]
    resources :items,      only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders,     only: [:new, :confirm, :complete, :create, :index, :show]
    post   'orders/confirm'  => 'orders#confirm'
    get    'orders/complete' => 'orders#complete'
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
