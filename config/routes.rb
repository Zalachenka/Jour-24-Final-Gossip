Rails.application.routes.draw do

  resources :gossip #ok
  resources :home
  root 'home#index'
  resources :welcome
  resources :contact
  resources :user
  resources :team
  resources :city
  resources :gossip do
  resources :comment
end

end
