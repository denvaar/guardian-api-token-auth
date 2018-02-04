defmodule GuardianTokenDemoWeb.Router do
  use GuardianTokenDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug GuardianTokenDemo.ApiAuthPipeline
  end

  scope "/api", GuardianTokenDemoWeb do
    pipe_through :api

    resources "/auth", AuthController, only: [:create]

    scope "/" do
      pipe_through :api_auth

      resources "/users", UserController, only: [:index, :update, :delete, :show, :create]
    end
  end
end
