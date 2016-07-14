defmodule Rialto.Api.V1.SessionController do
  use Rialto.Web, :controller

  import Ecto.Query, only: [where: 2]
  import Comeonin.Bcrypt
  import Logger

  alias Rialto.User

  def create(conn, %{"grant_type" => "password",
    "email" => email,
    "password" => password}) do

    try do
      # Attempt to retrieve exactly one user from the DB, whose
      #   email matches the one provided with the login request
      user = User
      |> where(email: ^email)
      |> Repo.one!
      cond do

        checkpw(password, user.password_hash) ->
          # Successful login
          Logger.info "User " <> email <> " just logged in"
          # Encode a JWT
          { :ok, jwt, _} = Guardian.encode_and_sign(user, :token)
          conn
          |> json(%{access_token: jwt}) # Return token to the client

        true ->
          # Unsuccessful login
          Logger.warning "User " <> email <> " just failed to login"
          conn
          |> put_status(401)
          |> render(Rialto.ErrorView, "401.json") # 401
      end
    rescue
      e ->
        IO.inspect e # Print error to the console for debugging
        Logger.error "Unexpected error while attempting to login user " <> email
        conn
        |> put_status(401)
        |> render(Rialto.ErrorView, "401.json") # 401
    end
  end

  def create(conn, %{"grant_type" => _}) do
    ## Handle unknown grant type
    throw "Unsupported grant_type"
  end
end
