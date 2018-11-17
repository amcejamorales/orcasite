defmodule OrcasiteWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(OrcasiteWeb.Types.{JSON, Account, Feed, Detection})

  alias OrcasiteWeb.Resolvers

  query do
    @desc "Get a list of feeds"
    field(:feeds, list_of(:feed), resolve: &Resolvers.Feed.index/2)

    @desc "Get a feed"
    field :feed, :feed do
      arg(:slug, :string)

      resolve(&Resolvers.Feed.show/2)
    end
  end

  mutation do
    @desc "Submit an orca sound detection"
    field :submit_detection, :detection_with_lockout do
      arg(:feed_id, :id)
      arg(:playlist_timestamp, :string)
      arg(:player_offset, :decimal)

      resolve(&Resolvers.Detection.submit/2)
    end

    @desc "Create a user"
    field :create_user, type: :user do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:email, non_null(:string))
      arg(:role, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.create/2)
    end
  end
end
