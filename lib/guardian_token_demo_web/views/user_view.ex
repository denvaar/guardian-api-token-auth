defmodule GuardianTokenDemoWeb.UserView do
  use GuardianTokenDemoWeb, :view
  alias GuardianTokenDemoWeb.{UserView, RoleView}

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      roles: render_many(user.roles, RoleView, "role.json", as: :role)}
  end
end
