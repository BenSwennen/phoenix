defmodule Rialto.Api.V1.UserView do
  use Rialto.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Rialto.Api.V1.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Rialto.Api.V1.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
    	"type": "user",
    	"id": user.id,
    	"attributes": %{
    		"email": user.email
    	}
    }
  end
end
