Rails.application.routes.draw do

  resources :knowledges do
    resources :majors do
      patch :pass, on: :member
    end
    resources :minors do
      patch :pass, on: :member
    end
  end

  namespace :admin do
    resources :lists, except: [:show] do
    end
    resources :items
    resources :knowledges do
      get :child, on: :member
    end
    get 'detail' => 'detail#index'
  end

end
