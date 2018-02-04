defmodule GuardianTokenDemo.Authentication do
  alias GuardianTokenDemo.Accounts
  alias GuardianTokenDemo.Accounts.User

  def authenticate(email, password) do
    user = Accounts.get_user_by_email(email)

    case check_password(user, password) do
      true -> {:ok, user}
      false -> {:error, Accounts.user_changeset(%User{})}
    end
  end

  def make_hash(nil), do: ""
  def make_hash(""), do: ""
  def make_hash(password), do: Comeonin.Bcrypt.hashpwsalt(password)

  defp check_password(nil, _password), do: false
  defp check_password(user, password), do: Comeonin.Bcrypt.checkpw(password, user.password_hash)
end
