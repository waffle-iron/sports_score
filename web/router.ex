defmodule SportScore.Router do
  use SportScore.Web, :router

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

  scope "/", SportScore do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", SportScore do
    pipe_through :api
    get "/logged_in", PageController, :logged_in
    resources "/sports", SportController, except: [:new, :edit]
    post "/sports/search", SportController, :search
  end

  # Other scopes may use custom stacks.
  # scope "/api", SportScore do
  #   pipe_through :api
  # end
end
