defmodule SportScore.Router do
  use SportScore.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Openmaize.Authenticate
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Openmaize.Authenticate
  end

  scope "/", SportScore do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index, as: :home
    get "/confirm", PageController, :confirm
    get "/askreset", PageController, :askreset
    post "/askreset", PageController, :askreset_password
    get "/reset", PageController, :reset
    post "/reset", PageController, :reset_password
    get "/login", PageController, :login, as: :login
    post "/login", PageController, :login_user, as: :login
    get "/twofa", PageController, :twofa
    post "/twofa", PageController, :login_twofa
    delete "/logout", PageController, :logout, as: :logout
    post "/register", PageController, :register
  end

  scope "/api", SportScore do
    pipe_through :api
    resources "/sports", SportController, except: [:new, :edit]
    post "/sports/search", SportController, :search
  end

  # Other scopes may use custom stacks.
  # scope "/api", SportScore do
  #   pipe_through :api
  # end
end
