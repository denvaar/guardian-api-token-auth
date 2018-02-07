defmodule GuardianTokenDemoWeb.RoleView do
  use GuardianTokenDemoWeb, :view
  alias GuardianTokenDemoWeb.RoleView

  def render("index.json", %{roles: roles}) do
    %{roles: render_many(roles, RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{role: render_one(role, RoleView, "role.json")}
  end

  def render("role.json", %{role: role}) do
    %{id: role.id,
      value: role.value,
      description: role.description}
  end
end
