Rails.application.routes.draw do
  devise_for :users


  root to: 'users#index'
  resources :users
  resources :exercises do
    resources :metrics do
	    resources :measurements
    end
  end

  namespace :api, format: :json do
    namespace :v1 do
    	mount_devise_token_auth_for 'User', at: 'auth'
    	resources :users
      resources :exercises do
    	  resources :metrics do
    		  resources :measurements
        end
    	end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
