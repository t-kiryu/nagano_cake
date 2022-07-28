Rails.application.routes.draw do

  namespace :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/ifromation' => 'customers#update'
    resources :customers
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres, :items, :customers
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
