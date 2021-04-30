Rails.application.routes.draw do
  devise_for :customers
  scope module: :public do
    root to: 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
