Rails.application.routes.draw do
  
  resources :foods do 
  	resources :comments
  end
  root to: "foods#index"
end
