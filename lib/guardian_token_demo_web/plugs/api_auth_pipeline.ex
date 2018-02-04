defmodule GuardianTokenDemo.ApiAuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :guardian_token_demo,
    module: GuardianTokenDemo.Guardian,
    error_handler: GuardianTokenDemo.ApiAuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated

  # These below can be considered optional. The resource will be loaded from the database
  # plug Guardian.Plug.LoadResource, ensure: true, allow_blank: true
  # plug GuardianTokenDemo.CurrentUser
end
