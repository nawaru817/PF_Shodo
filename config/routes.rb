Rails.application.routes.draw do
  devise_for :customers
  scope module: :public do
    root to: 'homes#top'

    get 'ranking', to: 'homes#ranking'

    resources :post_items, only: [:create, :edit, :update, :show, :destroy]do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
