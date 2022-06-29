defmodule IeyeWeb.PageController do
  use IeyeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
