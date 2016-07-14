defmodule Rialto.Router do
  use Rialto.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Rialto.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      post "/register", RegistrationController, :create
      resources "/session", SessionController, only: [:index]
    end
  end
end
