defmodule MyFarmWeb.PageController do
  use MyFarmWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
