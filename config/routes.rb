Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :people
  resources :events do
    resources :attendees, :controller => "event_attendees"

    collection do
      get :latest
      post :bulk_delete
    end

    member do
      post :like
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say_hello" => "welcome#say"
	get "welcome" => "welcome#index"
  get "welcome/ajaxtest" => "welcome#ajaxtest"

	root :to => "welcome#index"	

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
  resources :events
    post "login" => "auth#login"
    post "logout" => "auth#logout"
  end

end
