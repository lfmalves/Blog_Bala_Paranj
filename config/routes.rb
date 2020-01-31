Rails.application.routes.draw do
  get 'articles/index'
  resources :articles
  
  root 'welcome#index'
end
