Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  #resources :images

  root to: "home#index"
  get 'images/index'
  post 'images/child_images'
  post 'images/email_to_friend'
  post 'images/add_favourite'
  post 'images/get_response'
  get 'favourite/index'
end
