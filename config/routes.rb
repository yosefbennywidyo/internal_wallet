Rails.application.routes.draw do
  resources :users, :teams, :stocks, param: :code do
    resources :transaction_histories, param: :number, only: [:index]
  end

  scope shallow_path: "transaction_histories" do
    post 'debit', controller: 'transaction_histories', action: 'debit'
    post 'credit', controller: 'transaction_histories', action: 'credit'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
