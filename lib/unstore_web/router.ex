defmodule UnstoreWeb.Router do
  use UnstoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UnstoreWeb do
    pipe_through :api
  end
end
