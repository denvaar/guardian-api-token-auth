defmodule GuardianTokenDemo.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:users_roles, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :role_id, references(:roles, on_delete: :delete_all), null: false
    end

    create index(:users_roles, [:user_id])
    create index(:users_roles, [:role_id])
    create unique_index(:users_roles, [:user_id, :role_id])
  end
end
