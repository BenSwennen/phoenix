defmodule Rialto.Router do
  use Rialto.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  # Authenticated Requests
  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Rialto.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      post "/register", RegistrationController, :create
      post "token",     SessionController,      :create, as: :login
    end
  end

  scope "/api", Rialto.Api, as: :api do
    pipe_through :api_auth

    scope "/v1", V1, as: :v1 do
      get "/user/current", UserController, :current
    end
  end
end
