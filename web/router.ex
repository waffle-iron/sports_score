defmodule SportScore.Router do
  use SportScore.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :secure do
    plug Addict.Plugs.Authenticated
  end

  scope "/" do
    addict :routes
  end

  scope "/", SportScore do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", SportScore do
    pipe_through :api    

    scope "/private", SportScore do
      pipe_through :secure
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", SportScore do
  #   pipe_through :api
  # end
end
