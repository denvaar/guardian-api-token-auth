defmodule GuardianTokenDemoWeb.AuthController do
  use GuardianTokenDemoWeb, :controller

  alias GuardianTokenDemo.Authentication

  action_fallback GuardianTokenDemoWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    case Authentication.authenticate(email, password) do
      {:ok, user} ->
        {:ok, access_token, _claims} = GuardianTokenDemo.Guardian.encode_and_sign(user)
        #auth_conn = GuardianTokenDemo.Guardian.Plug.sign_in(conn, user)
        #access_token = GuardianTokenDemo.Guardian.Plug.current_token(auth_conn)
        render(conn, "show.json", access_token: access_token)

      {:error, changeset} ->
        render(conn, "show.json", changeset: changeset)
    end
  end
end
