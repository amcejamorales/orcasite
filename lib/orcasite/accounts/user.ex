defmodule Orcasite.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string, unique: true)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)
    field(:role, :string, default: "admin")

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :role, :password, :password_confirmation])
    |> validate_required([:first_name, :last_name, :email, :role, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8, max: 30)
    |> validate_nonconsecutive(:password)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
  end
end
