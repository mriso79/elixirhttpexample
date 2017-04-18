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
      html = File.read("web/home.html")
      conn
      |> send_resp(200, elem(html, 1))
      |> halt
    end

    match _ do
      conn
      |> send_resp(404, "Nothing here")
      |> halt
    end

end