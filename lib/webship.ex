defmodule Webship do
  @moduledoc false

    use Plug.Router
    use Plug.Builder
    require Logger

    plug Plug.Logger

    # Serves static content
    plug Plug.Static,
    at: "/", from: :apiship

    plug :match
    plug :dispatch

    def init(options) do
      options
    end

    def start_link do
      {:ok, _} = Plug.Adapters.Cowboy.http Webship, []
    end

    get "/" do
      html = File.read("priv/static/home.html")
      conn
      |> send_resp(200, elem(html, 1))
      |> halt
    end

    match _ do
      e404 = File.read("priv/static/404.html")
      conn
      |> send_resp(404, elem(e404, 1))
      |> halt
    end


end