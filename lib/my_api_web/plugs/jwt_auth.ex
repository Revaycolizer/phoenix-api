defmodule MyApiWeb.Plugs.JWTAuth do
  import Plug.Conn
  alias MyApiWeb.Auth.JWTAuth

  def init(default), do: default

  def call(conn, _opts) do
    case get_req_header(conn, "authorization") do
      ["Bearer " <> token] ->
        case JWTAuth.verify_jwt(token) do
          {:ok, _decoded} ->
            conn
          {:error, _reason} ->
            conn
            |> send_resp(401, "Unauthorized")
            |> halt()
        end

      _ ->
        conn
        |> send_resp(401, "Unauthorized")
        |> halt()
    end
  end
end
