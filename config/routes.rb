Rails.application.routes.draw do

  scope module: 'the_detail_my', as: 'detail' do
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
    scope path: ':taxon_type/:taxon_id' do
      resources :taxon_items
    end
    scope path: ':entity_type/:entity_id' do
      resources :entity_items
    end
    resources :items, only: [] do
      get :search, on: :collection
    end
  end

  scope :admin, as: 'admin', module: 'the_detail_admin' do
    resources :lists do
      resources :items
    end
  end

end
