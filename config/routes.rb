Rails.application.routes.draw do
post 'email', to:'userinscription#email', as: :verifemail
get 'deconn', to: 'userconnexion#destroy', as: :deconn
get '-en-ce-moment-', to: 'items#index2', as: :itm


get "cr1", to: "userconnexion#create", as: :create_userconnexion
post "/register", to: "userinscription#create", as: :create_userinscription
get "/modalSignup.php", to: "userinscription#new", as: :signupview
get "/template/modal/modalLogin.php", to: "userconnexion#new", as: :loginview
resources :items do
member do
get 'newsuggest', as: :newsuggest, action: :newsuggest
end
end
resources :suggestions
  post 'create', to: 'items#create', as: :create_items
  devise_for :users, controllers: { registrations: 'userinscription', sessions: 'userconnexion' }
  root to: 'welcome#page'
  get 'spip', to: 'welcome#index', as: :findstores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get ':title', to: 'suggestions#show', as: :route2
end
