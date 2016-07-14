defmodule Rialto.Api.V1.UserController do
  use Rialto.Web, :controller

  alias Rialto.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Rialto.Api.V1.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Rialto.Api.V1.UserView, "show.json", user: user)
  end
end
