Rails.application.routes.draw do


  scope module: :the_detail do

    resources :details do
      resources :contents

      resources :majors do
        patch :pass, on: :member
      end
      resources :minors do
        patch :pass, on: :member
      end
      get 'search/:q' => :search, as: :search, on: :collection
    end

    resources :lists do
      resources :items
    end
    resources :knowledges do
      get :child, on: :member
    end
    get 'detail' => 'detail#index'
  end

end
