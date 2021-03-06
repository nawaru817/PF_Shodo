Rails.application.routes.draw do

  #管理者用ルートです
  devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }

  namespace :admin do
    get 'top', to: 'homes#top'
    post 'guest_sign_in', to: 'homes#admin_guest_sign_in'
    resources :post_items, only: [:create, :edit, :update, :show, :destroy]do
      resources :post_comments, only: [:destroy]
    end
    resources :customers, only: [:index, :edit, :update, :show]do
      get 'favorite', to: 'customers#favorite'
    end
    get 'search_post_item', to: 'post_items#search_post_item'
    resources :tags, only:[:show]
  end

  #ユーザー用ルートです
  devise_for :customers
  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    post 'guest_sign_in', to: 'homes#guest_sign_in'

    get 'ranking', to: 'homes#ranking'

    get 'post_items', to: 'homes#top'
    resources :post_items, only: [:create, :edit, :update, :show, :destroy]do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'search_post_item', to: 'post_items#search_post_item'

    resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]do
      get 'favorite', to: 'customers#favorite'
    end

    resources :tags, only:[:show]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
