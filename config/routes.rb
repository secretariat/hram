# -*- encoding : utf-8 -*-
Hram::Application.routes.draw do
  get "pages/index"
  get "pages/gallery"
  root :to => 'pages#index'

  #   resources :products do
  #   end

  namespace :admin do
  	root :to => "pages#index"
    resources :gallery_categories
  end

end
