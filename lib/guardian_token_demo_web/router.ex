defmodule GuardianTokenDemoWeb.Router do
  use GuardianTokenDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug GuardianTokenDemo.ApiAuthPipeline
  end

  pipeline :super_admin_only do
    plug GuardianTokenDemo.ApiAuthPipeline
    plug GuardianTokenDemo.SuperAdminOnly
  end

  scope "/api", GuardianTokenDemoWeb do
    pipe_through :api

    resources "/auth", AuthController, only: [:create]

    scope "/" do
      pipe_through :super_admin_only

      resources "/users", UserController, only: [:index, :update, :delete, :show, :create]
      resources "/roles", RoleController, except: [:new, :edit]
    end
  end
end
