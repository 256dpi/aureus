Rails.application.routes.draw do
  root to: 'all#index'
  get 'centered' => 'all#centered', as: :centered
  resources :resources
end
