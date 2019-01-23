defmodule OrcasiteWeb.Types.Session do
  use Absinthe.Schema.Notation

  @desc "A session"
  object :session do
    field(:token, :string)
  end
end
