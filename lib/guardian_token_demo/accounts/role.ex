defmodule GuardianTokenDemo.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias GuardianTokenDemo.Accounts.{Role, User}


  schema "roles" do
    field :description, :string
    field :value, :string

    #many_to_many :users, User, join_through: "users_roles"

    timestamps()
  end

  @doc false
  def changeset(%Role{} = role, attrs) do
    role
    |> cast(attrs, [:value, :description])
    |> validate_required([:value, :description])
    |> unique_constraint(:value)
  end
end
