defmodule Apiship do
  @moduledoc """
  Serve data from a Database
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Webship, [])
    ]

    opts = [strategy: :one_for_one, name: Apiship.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
