Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "welcome#index"
  get "/welcome/find_choises", to: "welcome#find_choises"
  # resources :welcome do
  #   collection do  #  why collection ????
  #     get :render_read  #, on: :collection
  #     # or you may prefer to call this route on: :member
  #   end
  # end
end
