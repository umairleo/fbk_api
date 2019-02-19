Rails.application.routes.draw do
 
  resources :comments do
   member do
    put :likes
  end
end
  resources :posts do
    member do
      put :likes
  end
end
end