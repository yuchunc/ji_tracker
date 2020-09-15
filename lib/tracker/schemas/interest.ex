defmodule Tracker.Interest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "interests" do
    field :company, :string
    field :position, :string
    field :point_of_contact, :string
    field :field, :string
    embeds_many :tech_stack, :string, on_replace: :delete
    field :interest_rating, :integer
    field :estimate_rating, :integer
    field :thoughts, :string
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
end
