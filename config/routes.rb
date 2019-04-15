Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  #resources :images

  #root "images_controller#index"
  root to: "images#index"
  get 'images/index'
  post 'images/child_images'
end
