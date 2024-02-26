Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root'employees#index'
  resources :employees do
    collection do
      get :tax_deduction
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
