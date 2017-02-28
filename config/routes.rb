Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :responses

  root 'welcome#index'
end
