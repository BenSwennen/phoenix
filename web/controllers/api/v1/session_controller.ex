defmodule Rialto.Api.V1.SessionController do
  use Rialto.Web, :controller

  def index(conn, _params) do
    # Return some static JSON for now
    conn
    |> json(%{status: "Ok"})
  end
end
