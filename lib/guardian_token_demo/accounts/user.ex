defmodule GuardianTokenDemo.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias GuardianTokenDemo.Accounts.{User, Role}


  schema "users" do
    field :email, :string
    field :password_hash, :string

    many_to_many :roles, Role, join_through: "users_roles", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
    |> unique_constraint(:email)
  end
end
