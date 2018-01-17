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
      resources :exercise_types do
        resources :metrics
        member do
          get :default_goal
        end
      end
      resources :exercises do
        member do
          post :stop
        end
        resource :exercise_goal do
          resources :metric_goals
        end
        resource :exercise_result, only: [:show] do
          resources :metric_results
        end
  		  resources :measurements do
          collection do
            post :save
          end
        end
    	end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
