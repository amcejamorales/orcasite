defmodule OrcasiteWeb.Types.Account do
  use Absinthe.Schema.Notation

  @desc "A user"
  object :user do
    field :id, :id # clients can get the user id
    field :first_name, :string # clients can also ask for the name field
    field :last_name, :string
    field :email, :string
    field :role, :string
  end
end
