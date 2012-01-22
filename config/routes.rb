Loddit::Application.routes.draw do
  root :to => 'site#index'
  
  resources :articles

end
