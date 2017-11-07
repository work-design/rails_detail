Rails.application.routes.draw do

  scope module: 'the_detail', path: ':detail_type/:detail_id' do
    resource :note

    resources :items
    resources :majors do
      patch :pass, on: :member
    end
    resources :minors do
      patch :pass, on: :member
    end
  end

end
