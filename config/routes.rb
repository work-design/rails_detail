Rails.application.routes.draw do

  resources :lists

  namespace :admin do
    resources :lists, :except => [:show] do
      get 'taxon:id' => :taxon, :as => :taxon, :on => :collection
      resources :items
    end
    resources :knowledges
    get 'detail' => 'detail#index'
  end

end
