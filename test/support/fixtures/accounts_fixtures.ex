defmodule MyApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        password: "some password"
      })
      |> MyApi.Accounts.create_user()

    user
  end
end
