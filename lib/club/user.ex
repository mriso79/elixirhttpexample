defmodule Club.User do
  @moduledoc false

    use Ecto.Schema

    schema "usuario" do
      field :usu_id, :integer
      field :usu_nome, :string
      field :usu_email, :string
    end
end