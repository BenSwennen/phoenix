defmodule Rialto.Api.V1.RegistrationController do
  use Rialto.Web, :controller

  alias Rialto.User

  def create(conn, %{"data" => %{"attributes" =>
    %{"email" => email,
      "password" => password,
      "password-confirmation" => password_confirmation
    }, "type" => "users"}}) do

    changeset = User.changeset %User{}, %{email: email,
      password_confirmation: password_confirmation,
      password: password}

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Rialto.Api.V1.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Rialto.ChangesetView, "error.json", changeset: changeset)
    end

  end
end
