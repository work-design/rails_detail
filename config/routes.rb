Rails.application.routes.draw do

  resources :knowledges do
    resources :wikis do
      patch :pass, on: :member
    end
  end

  namespace :admin do
    resources :lists, except: [:show] do
    end
    resources :items
    resources :knowledges do

    end
    get 'detail' => 'detail#index'
  end

end
