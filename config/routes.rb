Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "welcome#index"
  get "/welcome/render_read", to: "welcome#render_read"
  # resources :welcome do
  #   collection do  #  why collection ????
  #     get :render_read  #, on: :collection
  #     # or you may prefer to call this route on: :member
  #   end
  # end
end
