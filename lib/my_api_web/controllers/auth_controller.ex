defmodule MyApiWeb.AuthController do
  use MyApiWeb, :controller
  alias MyApi.Accounts
  alias MyApiWeb.Auth.JWTAuth

  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        token = JWTAuth.generate_jwt(user)
        json(conn, %{token: token})

      {:error, reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: reason})
    end
  end
end
