defmodule Webship do
  @moduledoc false

    use Plug.Router
    require Logger

    plug Plug.Logger
    plug :match
    plug :dispatch

    def init(options) do
      options
    end

    def start_link do
      {:ok, _} = Plug.Adapters.Cowboy.http Webship, []
    end

    get "/" do
      conn
      |> send_resp(200, "<html><head><title>ApiShip v0.1</title></head><body><b>ApiShip v0.1</b> <br> Welcome to the ApiShip Server.</body></html>")
      |> halt
    end

    match _ do
      conn
      |> send_resp(404, "Nothing here")
      |> halt
    end

end