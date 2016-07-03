defmodule SportScore.PageController do
  use SportScore.Web, :controller

  import SportScore.{Authorize, Confirm}
  alias Openmaize.ConfirmEmail
  alias Openmaize.Login.Name
  alias SportScore.{Mailer, User}

  plug Openmaize.ConfirmEmail, [key_expires_after: 30,
    mail_function: &Mailer.receipt_confirm/1] when action in [:confirm]
  plug Openmaize.ResetPassword, [key_expires_after: 30,
    mail_function: &Mailer.receipt_confirm/1] when action in [:reset_password]

  plug Openmaize.Login, [unique_id: :email] when action in [:login_user]
  #plug Openmaize.Login, [unique_id: &Name.email_username/1, override_exp: 10_080]
  when action in [:login_user]
  plug Openmaize.OnetimePass when action in [:login_twofa]
  plug Openmaize.Logout when action in [:logout]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login_user(conn, params) do
    handle_login conn, params
  end

  def login_twofa(conn, params) do
    handle_login conn, params
  end

  def logout(conn, params) do
    handle_logout conn, params
  end

  def confirm(conn, params) do
    handle_confirm conn, params
  end


  def askreset_password(conn, %{"user" => %{"email" => email} = user_params}) do
    user = Repo.get_by(User, email: email)
    case user do
      nil -> render(conn, SportScore.ErrorView, "changesetErrors.json", errors: [{:not_found, "This user could not be found. Please check the email address!"}])
      _ ->
      {key, link} = Openmaize.ConfirmEmail.gen_token_link(email)
      changeset = User.reset_changeset(Repo.get_by(User, email: email), user_params, key)

      conn
      |> halt

      case Repo.update(changeset) do
        {:ok, _user} ->
          Mailer.ask_reset(email, key)
          render(conn, SportScore.PageView, "success.json", message: "An email containing the link to reset your password has been sent.")
        {:error, changeset} ->
          render(conn, SportScore.ErrorView, "changesetErrors.json", errors: changeset.errors)
      end

    end

  end

  def reset_password(conn, params) do
    handle_reset conn, params
  end

  def register(conn, %{"user_params" => user_params}) do
    {key, link} = ConfirmEmail.gen_token_link(Map.get(user_params, "email"))
    changeset = User.auth_changeset(%User{}, user_params, key)
    conn
    |> halt

    case Repo.insert(changeset) do
      {:ok, user} ->
        Mailer.ask_confirm(Map.get(user_params, "email"), key)
        render(conn, SportScore.UserView, "newUser.json", user: user)
      {:error, changeset} ->
        render(conn, SportScore.ErrorView, "changesetErrors.json", errors: changeset.errors)
    end
  end
end
