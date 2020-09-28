defmodule TrackerWeb.InterestLive.Show do
  use TrackerWeb, :live

  alias TrackerWeb.InterestView
  alias Tracker.Interest

  def mount(_, %{"interest_id" => interest_id, "user" => user}, socket) do
    assigns = %{
      interest: Repo.get(Interest, interest_id),
      user: user
    }
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    render(InterestView, "show.html", assigns)
  end
end
