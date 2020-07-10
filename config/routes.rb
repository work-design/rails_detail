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
    resources :knowledges
  end

end
