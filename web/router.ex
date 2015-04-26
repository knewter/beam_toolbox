defmodule BeamToolbox.Router do
  use BeamToolbox.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BeamToolbox do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/categories", CategoryController
    resources "/projects", ProjectController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BeamToolbox do
  #   pipe_through :api
  # end
end
