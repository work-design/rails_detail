Rails.application.routes.draw do

  resources :knowledges do
    resources :majors do
      patch :pass, on: :member
    end
    resources :minors do
      patch :pass, on: :member
    end
    get 'search/:q' => :search, as: :search, on: :collection
  end

  namespace :admin do
    resources :lists do
      resources :items
    end
    resources :knowledges do
      get :child, on: :member
    end
    get 'detail' => 'detail#index'
  end

  resources :parts
  namespace :site do
    root to: 'pages#index'
    resources :sites do
      patch :current, on: :member
    end
    resources :pages do
      post :sort, on: :collection
    end
    resources :navigations do
      patch :move_higher, on: :member
      patch :move_lower, on: :member
    end
    resource :account do
      get :style, on: :member
      get :analytics, on: :member
      get :social, on: :member
      get :aviary, on: :member
    end

    get 'media_library' => 'photos#index', as: "media_library"

    resources :page_parts do
      collection do
        get 'wysihtml5_link/:object_id' => 'page_parts#wysihtml5_link', as: :wysihtml5_link
        post 'wysihtml5_link/:object_id' => 'page_parts#insert_wysihtml5_link'
      end
    end

    resources :attachments do
      collection do
        get 'select/:page_part_id' => 'attachments#select', as: :select
        post 'insert/:page_part_id' => 'attachments#insert', as: :insert
        get 'select_collection/:page_part_id' => 'attachments#select_collection', as: :select_collection
        post 'insert_collection/:page_part_id' => 'attachments#insert_collection', as: :insert_collection
      end
    end

    resources :photos do
      collection do
        get 'wysihtml5_select/:object_id' => 'photos#wysihtml5_select', as: :wysihtml5_select
        post 'wysihtml5_insert/:object_id' => 'photos#wysihtml5_insert', as: :wysihtml5_insert
        get 'photo_select/:page_part_id' => 'photos#photo_select', as: :photo_select
        get 'photo_collection_select/:page_part_id' => 'photos#photo_collection_select', as: :photo_collection_select
        post 'insert_photo/:page_part_id' => 'photos#insert_photo', as: :insert_photo
        post 'insert_photo_collection/:page_part_id' => 'photos#insert_photo_collection', as: :insert_photo_collection
      end
      member do
        post :enhance
        get :link
      end
    end

    resources :inquiries, only: [:index, :show, :destroy] do
      collection do
        get :inbox
        get :spam
      end
      member do
        get :inbox_show
        patch :mark_as_read
        patch :unmark_spam
      end
    end
  end

  resources :inquiries
  resource :sitemap
  get '/robots', to: 'pages#robots', format: :txt

  get ':root/:subpage/:id' => "pages#show", as: "third_level_page"
  get ':root/:id' => "pages#show", as: "subpage"
  get ':id' => "pages#show", as: "page"

end
