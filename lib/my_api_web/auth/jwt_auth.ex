defmodule MyApiWeb.Auth.JWTAuth do
  use Joken.Config

  # Set up the JWT signing key (should be kept secure in production)
  @secret "your_secret_key"  # You can use an environment variable here for security

  # Generate a JWT for a user
  def generate_jwt(user) do
    payload = %{
      "user_id" => user.id,
      "email" => user.email
    }

    # Sign the JWT with the payload and secret key
    Joken.generate_and_sign(payload, %{"alg" => "HS256"}, @secret)
  end

  # Verify the JWT token
  def verify_jwt(token) do
    Joken.verify_and_validate(token, %{"alg" => "HS256"}, @secret)
  end
end
