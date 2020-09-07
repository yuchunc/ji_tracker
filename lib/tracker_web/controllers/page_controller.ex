defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  plug :put_layout, false when action in [:landing]

  def landing(conn, _params) do
    render(conn)
  end
end
