Rails.application.routes.draw do
  devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }

  namespace :admin do
    get 'top', to: 'homes#top'
    resources :post_items, only: [:create, :edit, :update, :show, :destroy]do
      resources :post_comments, only: [:destroy]
    end


  end

  devise_for :customers
  scope module: :public do
    root to: 'homes#top'

    get 'ranking', to: 'homes#ranking'

    resources :post_items, only: [:create, :edit, :update, :show, :destroy]do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]do
      get 'favorite', to: 'customers#favorite'
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
