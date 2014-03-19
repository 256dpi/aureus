Rails.application.routes.draw do
  root to: 'all#index'
  get 'centered' => 'all#centered'
  resources :resources
end
