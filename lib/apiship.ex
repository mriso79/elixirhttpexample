defmodule Apiship do
  @moduledoc """
  A simple web server
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Club.Repo, []),
      worker(Webship, [])
    ]

    opts = [strategy: :one_for_one, name: Apiship.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
