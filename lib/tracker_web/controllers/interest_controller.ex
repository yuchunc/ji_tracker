defmodule TrackerWeb.InterestController do
  use TrackerWeb, :controller

  def index(conn, _) do
    render(conn, interests: 1..10)
  end

  def show(conn, _) do
    render(conn)
  end

  def new(conn, _) do
    render(conn, header_text: "New Job Interest")
  end

  def edit(conn, _) do
    render(conn, header_text: "Edit Job Interest")
  end
end
