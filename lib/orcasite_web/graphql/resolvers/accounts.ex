defmodule OrcasiteWeb.Resolvers.Accounts do
  alias Orcasite.Accounts

  import Orcasite.AuthHelper

  def find_user(_parent, %{id: id}, _resolution) do
    case Orcasite.Accounts.find_user(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def create(params, _info) do
    Accounts.create_user(params)
  end

  def login(%{email: email, password: password}, _info) do
    with {:ok, user} <- login_with_email_pass(email, password),
         {:ok, jwt, _} <- Orcasite.Guardian.encode_and_sign(user),
         {:ok, _ } <- Orcasite.Accounts.store_token(user, jwt) do
      {:ok, %{token: jwt}}
    end
  end
end
