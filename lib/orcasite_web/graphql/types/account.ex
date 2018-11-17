defmodule OrcasiteWeb.Types.Account do
  use Absinthe.Schema.Notation

  @desc "A user"
  object :user do
    # clients can get the user id
    field(:id, :id)
    # clients can also ask for the name field
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:role, :string)
  end
end
