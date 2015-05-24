Rails.application.routes.draw do

  namespace :admin do
    resources :lists, :except => [:show] do
      get 'taxon:id' => :taxon, :as => :taxon, :on => :collection
      resources :items
    end
    get 'detail' => 'detail#index'
  end

end
