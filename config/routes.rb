Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'
  mount_graphql_devise_for 'User', at: 'api/auth'
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
end
