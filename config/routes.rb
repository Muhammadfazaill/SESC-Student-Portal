Rails.application.routes.draw do
  resources :homes
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/graduation', to: 'courses#graduation', as: 'graduation'
  get '/graduation_status/:student_id', to: 'courses#graduation_status', as: 'graduation_status'
  resources :courses do

    member do
      post 'enroll', to: 'enrollments#create'
    end
  
  end
  resources :enrollments
  resources :users
  patch '/profile', to: 'profiles#update', as: 'update_profile'
  root to: "homes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
