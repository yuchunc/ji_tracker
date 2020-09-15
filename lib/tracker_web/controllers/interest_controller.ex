defmodule TrackerWeb.InterestController do
  use TrackerWeb, :controller

  alias Tracker.Interest

  def index(conn, _) do
    render(conn, interests: 1..10)
  end

  def show(conn, _) do
    render(conn)
  end

  def new(conn, _) do
    render(conn, header_text: "New Job Interest", changeset: %Interest{} |> change)
  end

  def create(conn, %{"interest" => interest}) do
    case Interest.changeset(%Interest{}, interest) |> Repo.insert() do
      {:ok, interest} ->
        conn
        |> put_flash(:info, "Success!")
        |> redirect(to: "/i")

      {:error, changeset} ->
        render(conn, "new.html", header_text: "New Job Interest", changeset: changeset)
    end
  end

  def edit(conn, _) do
    render(conn, header_text: "Edit Job Interest", id: 1)
  end
end
