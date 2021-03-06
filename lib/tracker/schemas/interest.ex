defmodule Tracker.Interest do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "interests" do
    field :company, :string
    field :position, :string
    field :point_of_contact, :string
    field :field, :string
    field :tech_stack, {:array, :string}, on_replace: :delete
    field :interest_rating, :integer
    field :estimate_rating, :integer
    field :thoughts, :string

    field :user_id, :integer

    timestamps
  end

  def changeset(interst, attrs) do
    interst
    |> cast(attrs, [
      :company,
      :position,
      :point_of_contact,
      :field,
      :interest_rating,
      :estimate_rating,
      :thoughts
    ])
    |> validate_required([:company, :point_of_contact, :interest_rating, :estimate_rating])
    |> validate_number(:interest_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5)
    |> validate_number(:estimate_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5)
  end

  def query_user_interest(%{id: user_id}) do
    __MODULE__
    |> where(user_id: ^user_id)
    |> order_by(desc: :updated_at)
  end
end
