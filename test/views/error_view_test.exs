defmodule Rialto.ErrorViewTest do
  use Rialto.ConnCase, async: true

  import Phoenix.View

  test "renders 401.json" do
    assert render(Rialto.ErrorView, "401.json", []) ==
           %{errors: [%{code: 401, title: "Unauthorized"}]}
  end

  test "renders 403.json" do
    assert render(Rialto.ErrorView, "403.json", []) ==
           %{errors: [%{code: 403, title: "Forbidden"}]}
  end

  test "renders 404.json" do
    assert render(Rialto.ErrorView, "404.json", []) ==
           %{errors: [%{code: 404, title: "Not Found"}]}
  end

  test "render 500.json" do
    assert render(Rialto.ErrorView, "500.json", []) ==
           %{errors: [%{code: 500, title: "Internal Server Error"}]}
  end

  test "render any other" do
    assert render(Rialto.ErrorView, "505.json", []) ==
           %{errors: [%{code: 500, title: "Internal Server Error"}]}
  end
end
