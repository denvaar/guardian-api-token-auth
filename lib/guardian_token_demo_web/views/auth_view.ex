defmodule GuardianTokenDemoWeb.AuthView do
  use GuardianTokenDemoWeb, :view

  def render("show.json", %{access_token: access_token}), do: %{access_token: access_token}

  def render("show.json", %{changeset: _changeset}), do: %{errors: "invalid credentials"}
end
