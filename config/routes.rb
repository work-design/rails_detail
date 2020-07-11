Rails.application.routes.draw do

  scope :my, module: 'detail/my', as: :my do
    scope path: ':detail_type/:detail_id' do
      resource :note
      resources :pictures
      resources :majors do
        patch :pass, on: :member
      end
      resources :minors do
        patch :pass, on: :member
      end
    end
    scope path: ':knowable_type/:knowable_id' do
      resources :knowledges, only: [] do
        collection do
          get 'knowable' => :new_knowable
          post 'knowable' => :create_knowable
        end
      end
    end
    resources :knowledges
  end

  scope :admin, module: 'detail/admin', as: :admin do
    resources :lists do
      resources :items
    end
    scope path: ':taxon_type/:taxon_id' do
      resources :taxon_items do
        collection do
          get 'item' => :new_item
          get 'list' => :new_list
        end
      end
    end
    scope path: ':entity_type/:entity_id' do
      resources :entity_items
    end
  end

  scope module: 'detail' do
    resources :knowledges, only: [:index, :show] do
      collection do
        get :search
      end
    end
  end

end
