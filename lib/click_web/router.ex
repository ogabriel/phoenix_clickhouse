defmodule ClickWeb.Router do
  use ClickWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ClickWeb do
    pipe_through :api
  end
end
