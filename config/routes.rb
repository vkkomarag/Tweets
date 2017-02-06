Challenge::Application.routes.draw do
  get "tweets/index"

  get "tweets/:id", to: "tweets#show", as: "tweets_show"

  root :to => 'tweets#index'
end
