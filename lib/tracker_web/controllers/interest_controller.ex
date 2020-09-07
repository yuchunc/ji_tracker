defmodule TrackerWeb.InterestController do
  use TrackerWeb, :controller

  def index(conn, _) do
    render(conn, interests: 1..10)
  end
end
