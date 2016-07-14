defmodule Rialto.Api.V1.AuthErrorHandler do
 use Rialto.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(Rialto.Api.V1.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(Rialto.Api.V1.ErrorView, "403.json")
 end
end
