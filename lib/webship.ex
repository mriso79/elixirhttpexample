defmodule Webship do
  @moduledoc false

    use Plug.Router
    use Plug.Builder
    require Logger
    require Ecto.Query



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

    get "/users" do

      query = Ecto.Query.from p in Club.User, order_by: [asc: p.usu_id], select: [p.usu_id, p.usu_nome, p.usu_email]
      users = Club.Repo.all(query) |> JSON.encode()

      {status, content} = users

      conn
      |> send_resp(200, content )
      |> halt
    end

    match _ do
      e404 = File.read("priv/static/404.html")
      conn
      |> send_resp(404, elem(e404, 1))
      |> halt
    end


end