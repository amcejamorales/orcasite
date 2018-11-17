defmodule OrcasiteWeb.Resolvers.Accounts do
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

end
