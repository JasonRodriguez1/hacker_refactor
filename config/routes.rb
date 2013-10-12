HackerRefactor::Application.routes.draw do
  devise_for :users, path_names: {new_user_session: "login", destroy_user_session: "logout"} 
resources :users, :links
root :to => "links#index"
end
