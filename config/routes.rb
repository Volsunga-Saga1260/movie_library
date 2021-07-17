Rails.application.routes.draw do

  devise_for :customers
  scope module: :public do
    root :to => "homes#top"
    get 'about' =>  'homes#about'
    resources :customers, only: [:index, :show, :edit, :update] do
      collection do
        get :erase
        patch :close
      end
    end
    resources :movies, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end