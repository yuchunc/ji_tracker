defmodule TrackerWeb.InterestController do
  use TrackerWeb, :controller

  alias TrackerWeb.InterestLive
  alias Tracker.Interest

  def index(conn, _) do
    user = current_user(conn)
    render(conn, interests: Interest.query_user_interest(user) |> Repo.all())
  end

  def show(conn, %{"id" => id}) do
    live_render(conn, InterestLive.Show, session: %{"interest_id" => id, "user" => current_user(conn)})
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

  def edit(conn, %{"id" => id}) do
    interest = Repo.get(Interest, id)
    render(conn, header_text: "Edit Job Interest", changeset: change(interest))
  end

  def update(conn, %{"id" => id, "interest" => interest_form}) do
    interest_form_1 = Map.put(interest_form, "tech_stack", String.split(interest_form["tech_stack"], ",", trim: true))
    user = current_user(conn)
    interest = Repo.get(Interest, id)
    case Interest.changeset(interest, interest_form_1) |> Repo.update() do
      {:ok, _interest} ->
        conn
        |> put_flash(:info, "Success!")
        |> IO.inspect(label: "conn")
        |> redirect(to: "/i/#{id}")

      {:error, changeset} ->
        render(conn, "new.html", header_text: "Edit Job Interest", changeset: changeset)
    end
  end
end
