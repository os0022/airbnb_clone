Rails.application.routes.draw do
  get 'sign_up/index'

  root 'sign_up#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
