defmodule GuardianTokenDemo.SuperAdminOnly do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    if authorized?(conn) do
      conn
    else
      conn
      |> send_resp(403, "permission denied")
      |> halt()
    end
  end

  defp authorized?(conn) do
    conn
    |> GuardianTokenDemo.Guardian.Plug.current_claims()
    |> Map.get("pems")
    |> Enum.member?("super_admin")
  end
end
