defmodule GuardianTokenDemo.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias GuardianTokenDemo.Repo

  alias GuardianTokenDemo.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(%{"email" => email, "password" => password}), do: create_user(%{email: email, password: password})

  def create_user(%{email: email, password: password}) do
    %User{}
    |> User.changeset(%{email: email, password_hash: GuardianTokenDemo.Authentication.make_hash(password)})
    |> Repo.insert()
  end


  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> user_changeset(user)
      %Ecto.Changeset{source: %User{}}

  """
  def user_changeset(%User{} = user) do
    User.changeset(user, %{})
  end

  @doc """
  Returns a User by a given email address.

  ## Examples

      iex> get_user_by_email("cool_guy@aol.com")
      %User{}

  """
  def get_user_by_email(email), do: Repo.get_by(User, email: String.downcase(email))
end
