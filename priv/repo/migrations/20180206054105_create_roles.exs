defmodule GuardianTokenDemo.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :value, :string, null: false
      add :description, :string, null: false

      timestamps()
    end

    create unique_index(:roles, [:value])
  end
end
