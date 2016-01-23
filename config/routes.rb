Rails.application.routes.draw do
  get 'candidates/new'

  root              'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'support' => 'static_pages#support'
  get 'signup'  => 'candidates#new'
end