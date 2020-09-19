defmodule Tracker.Repo.Migrations.AddInterests do
  use Ecto.Migration

  def change do
    create table("interests") do
      add :company, :string, null: false
      add :position, :string
      add :point_of_contact, :string, null: false
      add :field, :string
      add :tech_stack, {:array, :string}
      add :interest_rating, :integer, null: false
      add :estimate_rating, :integer, null: false
      add :thoughts, :text

      add :user_id, references(:users), null: false

      timestamps
    end
  end
end
