Rails.application.routes.draw do


  scope module: :the_detail do

    resources :details do
      resources :contents
      resources :items
      resources :majors do
        patch :pass, on: :member
      end
      resources :minors do
        patch :pass, on: :member
      end
      get :child, on: :member
    end

  end

end
