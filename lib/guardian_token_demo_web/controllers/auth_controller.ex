defmodule GuardianTokenDemoWeb.AuthController do
  use GuardianTokenDemoWeb, :controller

  alias GuardianTokenDemo.Authentication

  action_fallback GuardianTokenDemoWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    with {:ok, user} <- Authentication.authenticate(email, password),
         {:ok, access_token, _claims} = GuardianTokenDemo.Guardian.encode_and_sign(user, %{pems: [:super_admin]})
    do
      render(conn, "show.json", access_token: access_token)
    else
      {:error, changeset} ->
        render(conn, "show.json", changeset: changeset)
    end
  end
end
