defmodule GuardianTokenDemo.Guardian do
  use Guardian, otp_app: :guardian_token_demo

  # alias GuardianTokenDemo.Accounts
  alias GuardianTokenDemo.Accounts.User

  def subject_for_token(user = %User{}, _claims) do
    {:ok, "User:#{user.id}"}
  end

  def subject_for_token(_resource, _claims), do: {:error, :unknown_resource}

  # Code below can be used when the resource is needed

  # def resource_from_claims(%{"sub" => "User:" <> user_id} = _claims) do
  #   id = String.to_integer(user_id)

  #   try do
  #     {:ok , Accounts.get_user!(id)}
  #   rescue
  #     Ecto.NoResultsError -> {:error, :no_results}
  #   end
  # end

  # def resource_for_claims(_claims), do: {:error, :not_found}
end
