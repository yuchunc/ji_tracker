defmodule TrackerWeb.InterestController do
  use TrackerWeb, :controller

  alias Tracker.Interest

  def index(conn, _) do
    user = current_user(conn)
    render(conn, interests: Interest.query_user_interest(user) |> Repo.all())
  end

  def show(conn, %{"id" => id}) do
    render(conn, interest: Repo.get(Interest, id))
  end

  def new(conn, _) do
    render(conn, header_text: "New Job Interest", changeset: %Interest{} |> change)
  end

  def create(conn, %{"interest" => interest}) do
    interest_1 = Map.put(interest, "tech_stack", String.split(interest["tech_stack"], ",", trim: true))
    user = current_user(conn)
    case Interest.changeset(%Interest{user_id: user.id}, interest_1) |> Repo.insert() do
      {:ok, _interest} ->
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
