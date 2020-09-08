defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  plug :put_layout, "basic.html"

  def landing(conn, _params) do
    render(conn)
  end
end
