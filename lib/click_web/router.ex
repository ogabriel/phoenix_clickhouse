defmodule ClickWeb.Router do
  use ClickWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    pipe_through :browser

    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi"
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: ClickWeb.ApiSpec
  end

  scope "/api" do
    pipe_through :api

    resources "/cars", ClickWeb.CarController, only: [:index, :create]

    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
  end
end
