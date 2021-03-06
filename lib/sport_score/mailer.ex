defmodule SportScore.Mailer do
  @moduledoc """
  An example module for sending emails.
  This example uses `mailgun`, but there are also other options available,
  such as `mailman`.
  """

  use Mailgun.Client, domain: Application.get_env(:sport_score, :mailgun_domain),
                      key:    Application.get_env(:sport_score, :mailgun_key)

  @from Application.get_env(:sport_score, :mailgun_from)
  @url_parts Application.get_env(:sport_score, SportScore.Endpoint)
  @base "#{@url_parts[:url][:scheme]}://#{@url_parts[:url][:host]}:#{@url_parts[:url][:port]}/"
  @doc """
  An email with a confirmation link in it.
  """
  def ask_confirm(email, key) do
    confirm_url = @base  <> "#!/confirm"
    send_email to: email,
              from: @from,
              subject: "Request confirmation",
              html: Phoenix.View.render_to_string(SportScore.EmailView, "ask_confirm.html", %{confirm_url: confirm_url, key: key})
  end

  @doc """
  An email with a link to reset the password.
  """
  def ask_reset(email, key) do
    confirm_url = @base <> "#!/reset_password"
    send_email to: email,
    from: @from,
    subject: "Reset password",
    html: Phoenix.View.render_to_string(SportScore.EmailView, "ask_reset.html", %{confirm_url: confirm_url, key: key})
  end

  @doc """
  An email acknowledging that the account has been successfully confirmed.
  """
  def receipt_confirm(email) do
    send_email to: email,
              from: @from,
              subject: "Successful confirmation",
              html: Phoenix.View.render_to_string(SportScore.EmailView, "receipt_confirm.html", %{})
  end
end
