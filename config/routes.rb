Rails.application.routes.draw do

  scope module: 'the_detail', path: ':detail_type/:detail_id' do
    resource :note

    resources :majors do
      patch :pass, on: :member
    end
    resources :minors do
      patch :pass, on: :member
    end
  end

  scope :admin, as: 'admin', module: 'the_detail_admin' do
    resources :lists do
      resources :items
    end
  end

end
